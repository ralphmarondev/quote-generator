yarn build
git add . && git commit -am "Latest version and dist subtree commit"
git subtree push --prefix dist origin gh-pages