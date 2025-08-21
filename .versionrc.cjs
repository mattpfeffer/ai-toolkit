module.exports = {
    types: [
        { type: 'build', hidden: true },
        { type: 'chore', hidden: true },
        { type: 'clean', hidden: true },
        { type: 'edit', hidden: true },
        { type: 'drop', section: 'Notices' },
        { type: 'feat', section: 'Features' },
        { type: 'fix', section: 'Fixes' },
        { type: 'test', hidden: true }
    ],
    skip: {
        // "tag": true
    },
    scripts: {}
};

// const path = process.cwd().replace(__dirname, '');
// const name = path.match(/([^/]*)$/, '')[0];

// module.exports = {
//     types: [
//         { type: 'build', hidden: true },
//         { type: 'chore', hidden: true },
//         { type: 'clean', hidden: true },
//         { type: 'edit', hidden: true },
//         { type: 'drop', section: 'Notices' },
//         { type: 'feat', section: 'Features' },
//         { type: 'fix', section: 'Fixes' },
//         { type: 'test', hidden: true }
//     ],
//     releaseCommitMessageFormat: path.startsWith('/packages')
//         ? `chore(release): ${name} {{currentTag}}`
//         : 'chore(release): {{currentTag}}',
//     tagPrefix: path.startsWith('/packages') ? `${name}\@` : 'v',
//     skip: {
//         // "tag": true
//     },
//     scripts: {
//         postchangelog: path.startsWith('/packages') ? 'node ../../.scripts/scope-changes.js' : ''
//     }
// };
