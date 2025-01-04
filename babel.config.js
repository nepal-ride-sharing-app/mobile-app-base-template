module.exports = {
    presets: [
        [
            "@babel/preset-env",
            {
              "modules": false
            }
          ],
        'module:metro-react-native-babel-preset',
        '@babel/preset-react'  // Add this line
    ],
    plugins: [
      [
        'module:react-native-dotenv',
        {
          envName: 'APP_ENV',
          moduleName: '@env',
          path: `./env/.env.${process.env.APP_ENV || 'local'}`,  // Load the environment file dynamically
          blocklist: null,
          allowlist: null,
          blacklist: null, // DEPRECATED
          whitelist: null, // DEPRECATED
          safe: false,
          allowUndefined: true,
          verbose: false,
        },
      ],
    ],
  };