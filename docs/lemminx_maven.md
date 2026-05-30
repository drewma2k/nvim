# lemminx-maven
- Would have to actually create a Mason registry in github with actions to
  compile the registry and relases if I wanted it to be ergonomic
- might as well just have my own lua module that installs the package for me
  - alternatively, it would be nice to contribute to mason or nvim-java

- [x] use Mason 2.0 if nvim-java supports it
- Lemminx patched for maven
  - options
    * mason package via github jar, seperate repo
    * mason package via jar, nvim repo
      + can those even have the jars moved?
    * mason registries can be configured to run build commands, so download the
      repo and run the build command?
    * combined lemminx + lemminx maven
- vscode-maven integration
  - Mason package
