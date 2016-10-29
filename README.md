# Github programming languages colors
Github colors for all the programming languages in a css file.

The css file follows this pattern:

	.ghc-shell-bg { background-color: #89e051; }
	.ghc-shell { color: #89e051; }

The name of the programming languages will be changed like this:

- The language name it's in downcase
- Change the spaces for -
- Change ' for -
- Change # for -sharp
- Change + for p

You can rebuild the css file executing

	$ ruby run.rb

#### Based on https://raw.githubusercontent.com/github/linguist/master/lib/linguist/languages.yml
