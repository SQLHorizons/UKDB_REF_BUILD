# Reference Build

## **Purpose**

Reference build for developing SQL Server deployments.

## **Requirements**

- Powershell v5.1
- Run As Administrator
- Windows Server 2016
- bitbucket user and token with read access to the project repository, and build submodule.
- deploy PowerShell module: [deploy](http://ms-oc27:8081/repository/SQLHorizons/deploy)

## **Overview**

This project can be used to test the SQL build process and is a template for project deliveries.

```powershell

##  deploy Azure DevOps agent.
$ServerParams = @{
    DeploymentGroup = "UKDB-REF-BUILD-BLUE"
    role            = "mirror"
    dns             = "db-oc22.avivahome.com"
}

##  import functions.
$script = "https://raw.githubusercontent.com/SQLHorizons/functions/master/public/Install-VSTSAgent.ps1"

Invoke-WebRequest -UseBasicParsing $script | Invoke-Expression
Install-VSTSAgent -ServerParams $ServerParams -Verbose

```

## **Release Branch Policy**

The following branch policy is used for release deployments, where the release/&lt;environment&gt; branch is the deployment branch for the target environment : -

| Branch                      | Purpose                       | Prevent                        | Exceptions    |
|-----------------------------|-------------------------------|--------------------------------|---------------|
| master                      | Initialise project repository | All changes                    | Administrator |
| release/&lt;environment&gt; | Target release environment    | Changes without a pull request |               |
| develop                     | Test release run              | Changes without a pull request |               |
| workspace                   | Project inputs                |                                |               |

The master branch is not used beyond the initialising of the project by the administrator.

## **Module Structure**

```markdown

repository: https://bitbucket.org/sqlhorizons/ukdb_ref_build.git
  .
  ├── .vsts-ci.yml
  ├── psvars.json
  └── README.md

```
