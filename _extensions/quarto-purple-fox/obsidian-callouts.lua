local stringify = (require "pandoc.utils").stringify

function BlockQuote(el)
  local start_para = el.content[1]
  
  if (start_para and start_para.t == "Para" and start_para.content[1] and 
      start_para.content[1].t == "Str" and 
      start_para.content[1].text:match("^%[%!")) then

    local inlines = start_para.content
    local first_line_inlines = {}
    local body_inlines = {}
    local break_found = false

    for i, inline in ipairs(inlines) do
      if (inline.t == "SoftBreak" or inline.t == "LineBreak") and not break_found then
        break_found = true
      else
        if not break_found then
          table.insert(first_line_inlines, inline)
        else
          table.insert(body_inlines, inline)
        end
      end
    end

    local first_line_str = stringify(first_line_inlines)
    
    local _, _, ctype = first_line_str:find("%[%!(%w+)%]")
    local title = first_line_str:match("%[%!%w+%](.*)")

    if not ctype then return el end
    
    ctype = ctype:lower()
    if title then
      title = title:match("^%s*(.*)")
    else
      title = ""
    end

    local new_body_content = {}

    if #body_inlines > 0 then
      table.insert(new_body_content, pandoc.Para(body_inlines))
    end

    for i = 2, #el.content do
      table.insert(new_body_content, el.content[i])
    end

    local callout_props = {
      type = ctype,
      content = new_body_content
    }
    if title ~= "" then
      callout_props.title = title
    end

    return quarto.Callout(callout_props)
  else
    return el
  end
end