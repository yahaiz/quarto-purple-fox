# Quarto Purple Fox Format

A beautiful Quarto HTML format extension with enhanced callout styling and support for Obsidian-style callouts.

## Features

- 🎨 Enhanced callout styling with rounded corners
- 🌓 Built-in light/dark mode toggle
- 📝 Support for Obsidian-style callouts (e.g., `[!tip]`, `[!warning]`, `[!note]`)
- 📑 Automatic table of contents
- 🎯 Based on Cosmo (light) and Darkly (dark) themes

## Installation

```bash
quarto add yahaiz/quarto-purple-fox
```

## Using

To use the format, add it to your document's YAML header:

```yaml
---
title: "My Document"
format:
  quarto-purple-fox-html: default
---
```

## Obsidian Callouts

This extension supports Obsidian-style callouts using the following syntax:

```markdown
> [!tip] Optional Title
> Your callout content here

> [!warning]
> Warning message

> [!note]
> Note content
```

Supported callout types: `note`, `tip`, `warning`, `caution`, `important`

## Format Options

You can customize the format by adding options in your document's YAML header:

```yaml
---
format:
  quarto-purple-fox-html:
    toc: true              # Enable/disable table of contents
    toc-depth: 3           # Set TOC depth
    theme-toggle: true     # Enable/disable theme toggle
---
```

All standard Quarto HTML format options are supported. See [Quarto HTML documentation](https://quarto.org/docs/output-formats/html-basics.html) for more details.

## Example

Here is the source code for a minimal sample document: [example.qmd](example.qmd).

You can also see the template file: [template.qmd](template.qmd).

## Customization

The extension includes:
- `custom.scss` - Custom SCSS styles for enhanced callout styling
- `obsidian-callouts.lua` - Lua filter for converting Obsidian callouts

You can modify these files to customize the appearance further.

## License

MIT License - see [LICENSE](LICENSE) file for details.

## Author

Created by yahaiz
