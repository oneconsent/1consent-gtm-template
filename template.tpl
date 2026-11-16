___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "1Consent CMP",
  "categories": [
    "TAG_MANAGEMENT"
  ],
  "description": "Load your published 1Consent banner and connect visitor choices to Google Consent Mode.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "siteId",
    "displayName": "1Consent Site ID",
    "simpleValueType": true,
    "help": "Copy the public Site ID from your published site in 1Consent. Use Consent Initialization – All Pages. This installation supports a single, all-region GDPR banner in Advanced Consent Mode.",
    "notSetText": "Enter your 1Consent Site ID.",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const copyFromWindow = require('copyFromWindow');
const gtagSet = require('gtagSet');
const injectScript = require('injectScript');
const setDefaultConsentState = require('setDefaultConsentState');
const setInWindow = require('setInWindow');
const updateConsentState = require('updateConsentState');

const bridgeKey = '__1ConsentGtmV1';
const alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_-';
const id = typeof data.siteId === 'string' ? data.siteId.trim() : '';
const validId = id.length === 12 && id.split('').every((character) => alphabet.indexOf(character) >= 0);

if (copyFromWindow(bridgeKey) || copyFromWindow('__1CONSENT_CONFIG__.appId')) {
  data.gtmOnFailure();
  return;
}

setDefaultConsentState({
  ad_storage: 'denied',
  ad_user_data: 'denied',
  ad_personalization: 'denied',
  analytics_storage: 'denied',
  functionality_storage: 'denied',
  personalization_storage: 'denied',
  security_storage: 'granted',
  wait_for_update: 500
});
gtagSet('developer_id.dYjRkMG', true);
gtagSet('ads_data_redaction', true);

if (!validId) {
  data.gtmOnFailure();
  return;
}

let status = 'loading';
const fail = () => {
  if (status !== 'loading') return;
  status = 'failed';
  data.gtmOnFailure();
};

const update = (state) => {
  if (status !== 'ready') return;
  updateConsentState({
    ad_storage: state.ad_storage === 'granted' ? 'granted' : 'denied',
    ad_user_data: state.ad_user_data === 'granted' ? 'granted' : 'denied',
    ad_personalization: state.ad_personalization === 'granted' ? 'granted' : 'denied',
    analytics_storage: state.analytics_storage === 'granted' ? 'granted' : 'denied',
    functionality_storage: state.functionality_storage === 'granted' ? 'granted' : 'denied',
    personalization_storage: state.personalization_storage === 'granted' ? 'granted' : 'denied',
    security_storage: state.security_storage === 'granted' ? 'granted' : 'denied'
  });
};

const ready = (settings, initialState) => {
  if (status !== 'loading') return;
  gtagSet('ads_data_redaction', settings.adsDataRedaction === true);
  gtagSet('url_passthrough', settings.urlPassthrough === true);
  status = 'ready';
  if (initialState) update(initialState);
  data.gtmOnSuccess();
};

if (!setInWindow(bridgeKey, {siteId: id, ready: ready, update: update, fail: fail}, false)) {
  fail();
  return;
}
injectScript('https://web.cmp.1consent.app/gtm/v1/' + id + '.js', () => {}, fail);


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "access_consent",
        "versionId": "1"
      },
      "param": [
        {
          "key": "consentTypes",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "ad_storage"
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "ad_user_data"
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "ad_personalization"
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "analytics_storage"
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "functionality_storage"
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "personalization_storage"
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "security_storage"
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "__1ConsentGtmV1"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "__1CONSENT_CONFIG__.appId"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://web.cmp.1consent.app/gtm/v1/*.js"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "write_data_layer",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keyPatterns",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "developer_id.dYjRkMG"
              },
              {
                "type": 1,
                "string": "ads_data_redaction"
              },
              {
                "type": 1,
                "string": "url_passthrough"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios:
- name: Defaults are set synchronously before the CMP loads
  code: |-
    let loaded = false;
    mock('injectScript', (url) => {
      assertApi('setDefaultConsentState').wasCalledWith({
        ad_storage: 'denied',
        ad_user_data: 'denied',
        ad_personalization: 'denied',
        analytics_storage: 'denied',
        functionality_storage: 'denied',
        personalization_storage: 'denied',
        security_storage: 'granted',
        wait_for_update: 500
      });
      assertThat(url).isEqualTo('https://web.cmp.1consent.app/gtm/v1/DemoSite01_A.js');
      loaded = true;
    });
    mock('setInWindow', () => true);
    runCode({siteId: 'DemoSite01_A'});
    assertThat(loaded).isTrue();
    assertApi('gtagSet').wasCalledWith('developer_id.dYjRkMG', true);
    assertApi('updateConsentState').wasNotCalled();
- name: Validated CMP choices reach Google through native updates
  code: |-
    let bridge;
    mock('setInWindow', (key, value) => { bridge = value; return true; });
    mock('injectScript', () => {});
    runCode({siteId: 'DemoSite01_A'});
    bridge.ready({adsDataRedaction: true, urlPassthrough: false});
    const choice = {
      ad_storage: 'denied',
      ad_user_data: 'denied',
      ad_personalization: 'denied',
      analytics_storage: 'granted',
      functionality_storage: 'denied',
      personalization_storage: 'denied',
      security_storage: 'granted'
    };
    bridge.update(choice);
    assertApi('updateConsentState').wasCalledWith(choice);
- name: The initial saved choice is replayed during the readiness handshake
  code: |-
    let bridge;
    mock('setInWindow', (key, value) => { bridge = value; return true; });
    mock('injectScript', () => {});
    runCode({siteId: 'DemoSite01_A'});
    const accepted = {
      ad_storage: 'granted',
      ad_user_data: 'granted',
      ad_personalization: 'granted',
      analytics_storage: 'granted',
      functionality_storage: 'denied',
      personalization_storage: 'denied',
      security_storage: 'granted'
    };
    bridge.ready({adsDataRedaction: true, urlPassthrough: false}, accepted);
    assertApi('updateConsentState').wasCalledWith(accepted);
- name: Invalid IDs keep the default and cannot load a script
  code: |-
    runCode({siteId: '../wrong.js?'});
    assertApi('setDefaultConsentState').wasCalled();
    assertApi('setInWindow').wasNotCalled();
    assertApi('injectScript').wasNotCalled();
- name: An existing banner does not get a second consent owner
  code: |-
    mock('copyFromWindow', (key) => key === '__1CONSENT_CONFIG__.appId' ? 'DemoSite01_A' : undefined);
    runCode({siteId: 'DemoSite01_A'});
    assertApi('setDefaultConsentState').wasNotCalled();
    assertApi('injectScript').wasNotCalled();
- name: Load failure does not allow a late grant
  code: |-
    let bridge;
    mock('setInWindow', (key, value) => { bridge = value; return true; });
    mock('injectScript', (url, ok, fail) => { fail(); });
    runCode({siteId: 'DemoSite01_A'});
    bridge.ready({adsDataRedaction: true, urlPassthrough: false});
    bridge.update({ad_storage: 'granted'});
    assertApi('updateConsentState').wasNotCalled();
setup: ''


___NOTES___

Created on 11/16/2026, 9:00:33 AM


