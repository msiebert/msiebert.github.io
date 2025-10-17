# msiebert.github.io - Jekyll Blog

## Project Overview

This is a personal blog built with Jekyll, hosted on GitHub Pages. It contains technical articles, project showcases, and presentations about software development topics.

## Technology Stack

- **Static Site Generator**: Jekyll
- **CSS Preprocessor**: LESS
- **Ruby Gems**:
  - `github-pages`: Provides GitHub Pages compatibility
  - `jekyll-sitemap`: Generates XML sitemaps for SEO

## Project Structure

```
├── _config.yml              # Jekyll configuration
├── _includes/               # Reusable HTML components
│   ├── header.html
│   ├── footer.html
│   └── social.html
├── _layouts/                # Page layout templates
│   ├── main.html           # Main layout
│   └── post.html           # Blog post layout
├── _posts/                  # Blog post content (Markdown)
├── assets/                  # Static assets
│   ├── css/                # Compiled stylesheets (output)
│   ├── fonts/              # Font files and Font Awesome icons
│   ├── img/                # Images and project screenshots
│   └── less/               # LESS source files (excluded from Jekyll)
├── presentations/          # Reveal.js presentation slides
├── docker/                 # Docker configuration for local development
├── Gemfile                 # Ruby dependencies
├── index.html              # Home page
└── CLAUDE.md              # This file

```

## Key Configuration

- **Domain**: https://msiebert.github.io/
- **Excluded directories**: `assets/less`, `docker`
- **Default post author**: Mark Siebert
- **Post layout**: All posts in `_posts/` automatically use the `post.html` layout

## Content

- **Blog Posts**: Located in `_posts/` directory (Markdown format)
  - Topics include: web development, programming languages, Docker, data tools
  - Date-based organization: `YYYY-MM-DD-slug.md`

- **Projects**: Showcased on the home page with logos and descriptions
  - Companies: Blue Matador, Cumulus, iEatFit, Lucid, Relate, Sharethrough

- **Presentations**: Reveal.js presentations in `presentations/` directory
  - Example: "Development with Docker" presentation

## Styling

- **LESS files**: Source styles in `assets/less/` (must be compiled before deployment)
- **CSS files**: Compiled output in `assets/css/`
- **Fonts**: Font Awesome 4.3.0 for icons
- **Design**: Concrete color scheme with custom blog styles

## Development & Deployment

### Prerequisites

- Ruby and Bundler (for Jekyll)
- Node.js and npm (for LESS compiler)

### Installation

```bash
# Install Ruby dependencies
bundle install

# Install LESS compiler
npm install -g less
```

### Local Development

1. **Compile LESS to CSS**:
   ```bash
   lessc assets/less/site.less assets/css/site.css
   ```

2. **Run Jekyll locally**:
   ```bash
   bundle exec jekyll serve
   ```

   Or use Docker:
   ```bash
   docker/run-docker.sh
   ```

### Deployment

**Required steps before pushing to GitHub Pages:**

1. **Compile LESS files** (REQUIRED):
   ```bash
   lessc assets/less/site.less assets/css/site.css
   ```

   This must be done before committing and pushing, as GitHub Pages will serve the compiled CSS.

2. **Test locally**:
   ```bash
   bundle exec jekyll build
   ```

3. **Commit and push**:
   ```bash
   git add assets/css/site.css
   git commit -m "Rebuild styles"
   git push
   ```

GitHub Pages will automatically build the Jekyll site and deploy it.

## Common Tasks

### Adding a Blog Post
1. Create a new file in `_posts/` with format: `YYYY-MM-DD-title.md`
2. Add frontmatter with layout, author, and post metadata
3. Write content in Markdown
4. Commit and push to trigger automatic deployment

### Modifying Styles
1. Edit `.less` files in `assets/less/`
2. Compile to CSS: `lessc assets/less/site.less assets/css/site.css`
3. Commit both the `.less` source and compiled `.css` files
4. Push to deploy

### Running Locally
- Use the provided Docker setup: `docker/run-docker.sh`
- Or use Jekyll directly with `bundle exec jekyll serve`
- Remember to compile LESS files before testing to see style changes

## Notes

- The site uses Jekyll's default post layout configuration
- Sitemap generation is enabled for SEO
- Font Awesome icons are used throughout the site
- Presentations use Reveal.js 3.3.0
- LESS source files are excluded from Jekyll builds (in `_config.yml`)
