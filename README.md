# accastampato, v1.0.1

Latex sources and assets for the [accastampato](http://www.accastampato.it) magazine by [accatagliato](http://www.accatagliato.org).


# Prerequisites

A modern Linux shell (ie. bash), PdfLaTeX, BibTex, imagemagick (convert utility), ...


# Fast how-to

Clone the repository with `git clone https://github.com/accatagliato/accastampato.git` or download and uncompress the tarball somewhere in your filesystem.

Enter the aforementioned directory: there you're provided with 3 scripts:

* make_issue
* make_article

The first one is used to generate the whole magazine, including cover, ToC,
editorial board; the second is useful to typeset a single article and generate
the retated PDF. The last one generates the PDFs of every single article.

Contents are stored in directory with names n[issue number of two digit]_[language iso-2]/
(ie. `n01_en/`).

There are also 4 subdirectories: `articles/`, `common/`, `graphics/`, `tex_stuff/`.
They are used to store, respectively, the articles' source files and images,
custom LaTeX classes, graphics files (magazine's background images, ads, cover
and so forth), LaTeX master files to generate the articles and magazine. This
is also the directory where generated PDFs will be stored in.

Make a copy of `common/` directory renaming it with your language, ie. `common/` -> `common_en/`.
To translate string, edit *openjournal.sty* and *openpaper.sty*.

It's very easy to invoke the scripts ([directory] is optional, you can store this string in `current` file):

`make_issue [directory]`

`make_article <path to article directory under articles/>`

They all use PdfLaTeX and many more shell script: be sure to install it before using the scripts.

You are allowed to generate up to 6 versions of both the magazine and the
articles. You can do it setting two flags in the file tex_stuff/issue_head.tex.
In the first row, where's the TeX file header, you can set "draft" or "final",
along with "electronic", "subscriber", or "printed". The first pair of flags
either allows or forbids to include images in the PDF, while the others
determine how big will be the PDF. It's done by providing, for every images,
two more versions: medium and low resolution. When you use "electronic" flag
(intended for an online PDF) the low resolution images (lores_<image name>) are
embedded in the PDF; when you use the "subscriber" flag the medium resolution
images are embedded in your PDF; the high resolution images will be embedded in
case you use the "printed" flag. In the latter case your document will show the
crop marks, as it will be suitable for printing house. This is the reason for
having images a little larger than needed: the printing houses want bleeding
images.
