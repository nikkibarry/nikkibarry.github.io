module Jekyll
    class SectionTagBlock < Liquid::Block
        def initialize(tag_name, markup, tokens)
            super
            params = markup.split
            @tag = params.shift
            @anchor = params.shift
        end

        def render(context)
            content = super
            "<#{@tag} id=\"#{@anchor}\">#{content}</#{@tag}><br/>"
        end
    end
end

Liquid::Template.register_tag('section', Jekyll::SectionTagBlock)  