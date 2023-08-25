#  CI Pipelines in a Monorepo with Maven and Angular Projects

This is an almost ready to go example of a simple CI Pipeline for a MonoRepo with 1 Maven Project and 1 Angular Project

## what it does and how it works
### Angular
The Angular Pipeline is rather simple.
1. SonarCloud Checks
2. Compiling and Building your Angular Files with Node.js
3. Pushing your Image to the GHCR

### Java/Maven
The Java/Maven Pipeline is only a bit more complicated than the Angular one (And that only because of underlying technologies).
1. SoncarCLoud Checks with the according Maven Plugin (as recommended by the doc)
2. Build & Publish your Image with JIB


## Things you will have to do if you want to use this:
  1. swap the files out of the java/angular directories with your own.
  2. Create your sonarcloud account and after that create the java and the angular project as monorepos. How you do that is rather good described on the sonarcloud website.
  3. Create your own secrets
     Following secrets need to be created:
     * `TOKEN` (THis is your Access Token for Github used by SonarCloud and the Connection to GHCR. If you want the automatically generated `GITHUB_TOKEN` change it to that in the source code of the workflows)
     * `SONAR_TOKEN_JAVA` (This is the token created by SonarCloud for the Java project there)
     * `SONAR_TOKEN_ANGULAR` (This is the token created by SonarCloud for the Angular project there)
       
     And that's it. I won't go into detail how and why and where you create these. You can find this information with a quick search in your preffered Browser.
  4. change the step `Build and analyze` in the sonarqube job in the java.yml. You have to change the `-Dsonar.projectKey=` with your own value according to sonarcloud/sonarqube.
  5. as designed by me here. Sonarcloud gets triggered by and also checks the master/main branch and every branch starting as `feature-xxxx` branch. This is true for angular and java. Change that if you don't want that by removing the branches.
  6. In the pom.xml of the Java/Maven Project change following part: ``` <properties> <sonar.organization>YOUR-ORGANIZATION-NAME</sonar.organization> <sonar.host.url>YOUR-SONARQUBE-HOST-URL/sonar.host.url> </properties> ``` according to your specific use of Sonarcloud/SonarQube. you got the right values when creating the java/maven project in sonarcloud or sonarqube.
  7. Also check that the `<name>` and `<artifactId>` match the name of the reffering sonarcloud/sonarqube project.
  8. Replace the values of the sonar-project.properties with your values. You received these when you created the angular project in sonarcloud/sonarqube.
  10. Your Angular project needs a Dockerfile for Building the image. Create one that works with your project.
  11. Using a private Sonarqube instance may need additonal work. Check what needs to be added on the specific workflow documentation. you may need to swap the workflow entirely. Godspeed you.
  12. And that should be it. 
