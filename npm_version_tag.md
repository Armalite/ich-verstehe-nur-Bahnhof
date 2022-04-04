# NPM Semantic Versioning + Pushing Git Tags
You can use the npm node.js library to bump semantic versions of your application.

NPM version automatically creates a commit with your updated package.json and creates a tag for locally as well.

To bump the patch version number and then push single tag that was created (assuming you are bumping from 0.0.1 to 0.0.2):

```bash
npm version patch
git push origin v0.0.1
```

If you are working in a feature branch, the above will push the v0.0.1 tag to your remote feature branch.