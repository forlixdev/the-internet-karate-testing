function fn() {

  // environment variable: to set the property from command line: -Dkarate.env=qa
  var env = karate.properties['env'] || 'test';
  karate.log('system property for environment is: ' + env + ', default "test"');

  // browser settings, if not set it takes chrome
  var browser = karate.properties['browser'] || 'chrome';
  karate.log('the browser set is: ' + browser + ', default: "chrome"');

  // grid flag, if not set it takes false. The grid url is in this format http://localhost:4444/wd/hub
  var grid_url = karate.properties['grid_url'] || false;
  karate.log('the grid url set is: ' + grid_url + ', default: false');

  // proxy settings: to set the property from command line: -Dproxy=http://127.0.0.1:9080
  var proxy = karate.properties['proxy'] || false;
  karate.log('system property for proxy is: ', proxy);
  karate.log('the proxy url set is: ' + proxy + ', default: false');

  // set environments variables/properties
  var config = {
    env: env,
    host: 'http://127.0.0.1:7080'
  };

  // Here the properties specified above can be overriden
  if (env == 'dev') {
    config.host = 'https://dev01.signicat.com';
  }

  if (proxy) {
      karate.log("set up proxy");
      karate.configure('proxy', proxy);
      karate.configure('ssl',true);
    }

    karate.log("the value for driver set is: "+browser);

  // set chrome or firefox depending on maven settings
  if (browser == 'chrome') {
      if (!grid_url) {
         karate.configure('driver', { type: 'chromedriver', executable: 'chromedriver' });
         karate.log("Selected Chrome");
      } else {
         karate.configure('driver', { type: 'chromedriver', start: false, webDriverUrl: grid_url });
         karate.log("Selected Chrome in grid");
      }
   } else if (browser == 'firefox') {
      if (!grid_url) {
          karate.configure('driver', { type: 'geckodriver', executable: 'geckodriver' });
          karate.log("Selected Firefox");
      } else {
          karate.configure('driver', { type: 'geckodriver', start: false, webDriverUrl: grid_url });
          karate.log("Selected Firefox in grid");
      }
   }

  return config;
}