# Engine Design

The engine should take information written externally using a markup language and display it as a finished CAL.

Pages may scroll on smaller screens.

## Markup

The most appropriate markup for this project is XML.

## Structure

### Document

- Name

- Many Sections

### Section

- Name
- Theme colour
- Optional (boolean, indicates the section is optional content)
- Many Pages

### Page

- Name (title)
- Notes
  - Additional information accompanying the main text
  - Semantically tied with the whole page, not a specific part of it
    - May be displayed alongside or below the page
  - Not necessary for full understanding
    - May be omited in some contexts
- Many paragraphs

### Paragraph

- May be a subtitle
- May be a block of text
  - Text may have emphasis
- May be an image

