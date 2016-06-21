module ApplicationHelper

  def hash_to_hidden_fields(hash)
    query_string = Rack::Utils.build_nested_query(hash)
    pairs        = query_string.split(Rack::Utils::DEFAULT_SEP)

    tags = pairs.map do |pair|
      key, value = pair.split('=', 2).map { |str| Rack::Utils.unescape(str) }
      hidden_field_tag(key, value)
    end

    tags.join("\n").html_safe
  end

  def categories_tree(hash_tree, level=0)
    if level == 0
      capture do
        hash_tree.each do |k, v|
          concat categories_tree(v, level+1)
        end
      end
    else
      content_tag :ul, class: 'categories-tree' do
        hash_tree.each do |tree, subtree|
          concat(
            content_tag(:li) do
            doc_count = @category_ids_buckets.find{|bucket| bucket['key'] == tree.id}.try(:[], 'doc_count')
            parameters = request.query_parameters.deep_dup
            if parameters['category_id'] == tree.id.to_s
              parameters.delete 'category_id'
              method = ->(block){concat(content_tag(:strong, class: 'text-warning', &block))}
            else
              parameters['category_id'] = tree.id.to_s
              method = ->(block){block.call}
            end
            if doc_count
              method2 = ->(block){concat(link_to(farm_search_path(parameters), style: 'display: block; margin-bottom: .5rem;', &block))}
            else
              method2 = ->(block){concat(link_to(farm_search_path(category_id: tree.id), class: 'text-muted', style: 'display: block; margin-bottom: .5rem;', &block))}
            end


            method2.call(->{ 
              method.call(->{
                concat content_tag(:span, tree.es_body['title'])
                concat " "
                #concat " [id #{tree.id}] "
                if doc_count
                  concat(content_tag(:small) do
                    concat "("
                    concat content_tag(:span, doc_count)
                    concat ")"
                  end)
                end
              })
            })
              if subtree.present?
                concat categories_tree(subtree, level+1)
              end
            end
          )
        end
      end
    end
  end

  def option_filter(title)
    concat content_tag :h5, Tree.roots.where(es_index: 'farm', es_type: title).first.es_body['title']
    content_tag :div, class: "custom-controls-stacked" do
      options_root(title).children.each do |value|
        custom_orange = @option_values[title] && @option_values[title].find{|el| el.id == value.id} ? "custom-orange" : ""
        concat(content_tag(:label, class: "custom-control custom-checkbox #{custom_orange}") do
          doc_count = @option_buckets[title].find{|bucket| bucket['key'] == value.id}.try(:[], 'doc_count')
          checkbox_opts = {class: 'js-filter-control js-filter-check-box custom-control-input'}
          checkbox_opts['disabled'] = 'disabled' unless doc_count
          if @option_values[title] && @option_values[title].find{|el| el.id == value.id}
            check_box_checked = true
          end
          concat check_box_tag(title + "[]", value.id, check_box_checked, checkbox_opts)
          concat content_tag(:span, '', class: "custom-control-indicator")
          doc_count_str = doc_count.present? ? "(#{doc_count})" : ''
          #concat " [id #{value.id}] "
          description_opts = {class: 'custom-control-description'}
          description_opts[:class] += ' text-primary' if doc_count
          concat(content_tag(:span, description_opts) do
            concat value.es_body['title']
            concat " "
            concat content_tag(:small, doc_count_str) 
          end)
        end)
      end
    end
  end
end
