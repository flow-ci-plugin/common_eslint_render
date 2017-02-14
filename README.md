# eslint_plugin_render Step
The pluggable linting utility for JavaScript and JSX

### INPUTS

* `FLOW_ESLINT_LOG_PATH` - eslint log path.


## EXAMPLE 

```yml
steps:
  - name: eslint_plugin_render
    enable: true
    failure: true
    plugin:
      name: eslint_plugin_render
      inputs:
        - FLOW_ESLINT_LOG_PATH=$FLOW_ESLINT_LOG_PATH
```
