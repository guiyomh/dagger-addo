package addo2022

import (
	"dagger.io/dagger"
	"dagger.io/dagger/core"

	// "universe.dagger.io/docker"

	"github.com/guiyomh/dagger/actions/markdown"
	"github.com/guiyomh/dagger/actions/marp"
)

// Default docker registry
_#DefaultAwsAccount: "000000000"
_#DefaultAwsRegion:  "eu-west-3"

dagger.#Plan & {
	// client: filesystem: "./public": write: contents: actions.build.output
	client: filesystem: "./public/html": write: contents: actions.build.html.output
	client: filesystem: "./public/pdf": write: contents: actions.build.pdf.output
	client: filesystem: "./public/pptx": write: contents: actions.build.pptx.output
	actions: {
		// Load the source code
		_source: core.#Source & {
			path: "."
			exclude: [
				"node_modules",
				"dist",
				"*.cue",
				".git",
			]
		}

		_image: {
			markdownlint: markdown.#Image // & {

			//     repository: "\(_#DefaultAwsAccount).dkr.ecr.\(_#DefaultAwsRegion).amazonaws.com/public/tmknom/markdownlint"
			//     tag: "0.31.1"
			//     auth: {
			//         username: "AWS"
			//         secret:  client.commands.ecrPassword.stdout
			//     }
			// }
		}

		// Lint the project
		lint: {

			// Lint markdown file
			"markdown": markdown.#Lint & {
				image:  _image.markdownlint
				source: _source.output
				files: ["slides.md"]
			}
		}

		// build marp
		build: {
			assets: core.#Copy & {
				input:    _source.output
				contents: _source.output
				source:   "/assets"
				dest:     "/dist/assets"
			}
			html: marp.#Build & {
				source:     assets.output
				markdown:   "slides.md"
				outputDir:  "/dist"
				theme:      "addo.css"
				outputType: "html"
			}
			pdf: marp.#Build & {
				source:     _source.output
				markdown:   "slides.md"
				outputDir:  "/dist"
				theme:      "addo.css"
				name:       "addo2022"
				outputType: "pdf"
			}
			pptx: marp.#Build & {
				source:     _source.output
				markdown:   "slides.md"
				outputDir:  "/dist"
				theme:      "addo.css"
				name:       "addo2022"
				outputType: "pptx"
			}

			_result: core.#Merge & {
				inputs: [html.output, pptx.output, pdf.output]
			}

			output: _result.output
		}
	}
}
