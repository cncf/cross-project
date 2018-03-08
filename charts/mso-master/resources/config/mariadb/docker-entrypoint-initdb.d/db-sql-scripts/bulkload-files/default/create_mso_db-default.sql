SOURCE ../../camunda/mariadb_engine_7.7.3-ee.sql

--
-- Create an admin user automatically for the cockpit
--
SOURCE ../../camunda/mysql_create_camunda_admin.sql

--
-- Current Database: `mso_requests`
--

DROP DATABASE IF EXISTS `mso_requests`;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mso_requests` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `mso_requests`;

SOURCE ../../main-schemas/MySQL-Requests-schema.sql

--
-- Current Database: `mso_catalog`
--

DROP DATABASE IF EXISTS `mso_catalog`;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mso_catalog` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `mso_catalog`;

SOURCE ../../main-schemas/MySQL-Catalog-schema.sql

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;

INSERT INTO `heat_template` (`ARTIFACT_UUID`, `NAME`, `VERSION`, `DESCRIPTION`, `BODY`, `TIMEOUT_MINUTES`, `ARTIFACT_CHECKSUM`, `CREATION_TIMESTAMP`) VALUES ('4885c198-a9fe-11e7-8b4b-0242ac120002','Contrail30-l2nodhcp','1',NULL,'heat_template_version: 2015-04-30\n\ndescription:\n  HOT template that creates a Contrail Virtual Network with L2NODHCP\n\nparameters:\n  network_name:\n     type: string\n     description: Name of direct network (e.g. core, dmz)\n     default: ECOMPNetwork\n  shared:\n     type: boolean\n     description: Shared amongst tenants\n     default: False\n  external:\n     type: boolean\n     description: router_external for the VirtualNetwork\n     default: False\n  route_targets:\n    type: comma_delimited_list\n    description: Network route-targets (RT)\n    default: \"\"\n  subnet_list:\n     type: json\n     description: Network subnets\n     default: []\n  policy_refs:\n     type: comma_delimited_list\n     description: Policies referenced by Network\n     default: \"\"\n  policy_refsdata:\n     type: json\n     description: Policies referenced by Network\n     default: []\n  route_table_refs:\n     type: comma_delimited_list\n     description: Route Tables referenced by Network\n     default: \"\"\n  virtual_network_properties_allow_transit:\n     type: boolean\n     description: allow_transit for the VirtualNetwork\n     default: True\n  virtual_network_properties_forwarding_mode:\n     type: string\n     description: forwarding_mode for the VirtualNetwork\n     default: l2\n  virtual_network_properties_rpf:\n     type: string\n     description: rpf for the VirtualNetwork\n     default: disable\n  flood_unknown_unicast:\n     type: boolean\n     description: flood_unknown_unicast for the VirtualNetwork\n     default: True\n\noutputs:\n  network_id:\n    description: Openstack network identifier\n    value: { get_resource: network }\n  network_fqdn:\n    description: Openstack network identifier\n    value: {list_join: [\':\', { get_attr: [network, fq_name] } ] }\n\nresources:\n  networkIpam:\n    type: OS::ContrailV2::NetworkIpam\n    properties:\n      name: { get_param: network_name }\n\n  network:\n    type: OS::ContrailV2::VirtualNetwork\n    properties:\n      name: { get_param: network_name }\n      is_shared: {get_param: shared}\n      router_external: { get_param: external }\n      route_target_list:\n        {\n           route_target_list_route_target: { get_param: route_targets }\n        }\n      network_ipam_refs: [{ get_resource: networkIpam }]\n      network_ipam_refs_data:\n        [\n          {\n             network_ipam_refs_data_ipam_subnets: { get_param: subnet_list }\n          }\n        ]\n      network_policy_refs:  { get_param: policy_refs }\n      network_policy_refs_data: { get_param: policy_refsdata }\n      route_table_refs: { get_param: route_table_refs }\n      flood_unknown_unicast: { get_param: flood_unknown_unicast }  \n      virtual_network_properties:\n        {\n           virtual_network_properties_allow_transit: { get_param: virtual_network_properties_allow_transit },\n           virtual_network_properties_forwarding_mode: { get_param: virtual_network_properties_forwarding_mode },\n           virtual_network_properties_rpf: { get_param: virtual_network_properties_rpf },\n        }\n',10,'MANUAL RECORD','2017-10-05 18:52:03');

INSERT INTO `heat_template` (`ARTIFACT_UUID`, `NAME`, `VERSION`, `DESCRIPTION`, `BODY`, `TIMEOUT_MINUTES`, `ARTIFACT_CHECKSUM`, `CREATION_TIMESTAMP`) VALUES ('4885c7a1-a9fe-11e7-8b4b-0242ac120002','Contrail30-gndirect','1',NULL,'heat_template_version: 2015-04-30\n\ndescription:\n  HOT template that creates a Contrail Virtual Network for GNDIRECT\n\nparameters:\n  network_name:\n     type: string\n     description: Name of direct network (e.g. core, dmz)\n     default: ECOMPNetwork\n  shared:\n     type: boolean\n     description: Shared amongst tenants\n     default: False\n  external:\n     type: boolean\n     description: router_external for the VirtualNetwork\n     default: False\n  route_targets:\n    type: comma_delimited_list\n    description: Network route-targets (RT)\n    default: \"\"\n  subnet_list:\n     type: json\n     description: Network subnets\n     default: []\n  policy_refs:\n     type: comma_delimited_list\n     description: Policies referenced by Network\n     default: \"\"\n  policy_refsdata:\n     type: json\n     description: Policies referenced by Network\n     default: []\n  route_table_refs:\n     type: comma_delimited_list\n     description: Route Tables referenced by Network\n     default: \"\"\n  virtual_network_properties_rpf:\n     type: string\n     description: rpf for the VirtualNetwork\n     default: disable\n\noutputs:\n  network_id:\n    description: Openstack network identifier\n    value: { get_resource: network }\n  network_fqdn:\n    description: Openstack network identifier\n    value: {list_join: [\':\', { get_attr: [network, fq_name] } ] }\n\nresources:\n  networkIpam:\n    type: OS::ContrailV2::NetworkIpam\n    properties:\n      name: { get_param: network_name }\n\n  network:\n    type: OS::ContrailV2::VirtualNetwork\n    properties:\n      name: { get_param: network_name }\n      is_shared: {get_param: shared}\n      router_external: { get_param: external }\n      route_target_list:\n        {\n           route_target_list_route_target: { get_param: route_targets }\n        }\n      network_ipam_refs: [{ get_resource: networkIpam }]\n      network_ipam_refs_data:\n        [\n          {\n             network_ipam_refs_data_ipam_subnets: { get_param: subnet_list }\n          }\n        ]\n      network_policy_refs:  { get_param: policy_refs }\n      network_policy_refs_data: { get_param: policy_refsdata }\n      route_table_refs: { get_param: route_table_refs }\n      virtual_network_properties:\n        {\n           virtual_network_properties_rpf: { get_param: virtual_network_properties_rpf }\n        }\n',10,'MANUAL RECORD','2017-10-05 18:52:03');

INSERT INTO `heat_template` (`ARTIFACT_UUID`,`NAME`,`VERSION`,`BODY`,`TIMEOUT_MINUTES`,`DESCRIPTION`,`CREATION_TIMESTAMP`,`ARTIFACT_CHECKSUM`) VALUES ('efee1d84-b8ec-11e7-abc4-cec278b6b50a','Generic NeutronNet','1','heat_template_version: 2013-05-23\n\ndescription:\n  HOT template that creates a Generic Neutron Network\n\nparameters:\n  network_name:\n     type: string\n     description: Name of direct network (e.g. core, dmz)\n     default: ECOMPNetwork\n  network_subnet_name:\n     type: string\n     description: Name of subnet network (e.g. core, dmz)\n     default: ECOMPNetwork\n  network_subnet_cidr:\n     type: string\n     description: CIDR of subnet network (e.g. core, dmz)\n     default: 10.0.0.0/16\n\noutputs:\n  network_id:\n    description: Openstack network identifier\n    value: { get_resource: network }\n  network_fqdn:\n    description: Openstack network identifier\n    value: {list_join: [\':\', { get_attr: [network, fq_name] } ] }\n\nresources:\n              network:\n                type: OS::Neutron::Net\n                properties:\n                name: {get_param: network_name }\n\n              subnet:\n                type: OS::Neutron::Subnet\n                properties:\n                name: { get_param: network_subnet_name  }\n                network_id: { get_resource: network }\n                cidr: { get_param: network_subnet_cidr }\n                enable_dhcp: false\n',10,'Generic Neutron Template','2017-10-26 14:44:00', 'MANUAL RECORD');

INSERT INTO `heat_template_params` (`HEAT_TEMPLATE_ARTIFACT_UUID`, `PARAM_NAME`, `IS_REQUIRED`, `PARAM_TYPE`, `PARAM_ALIAS`) VALUES ('4885c198-a9fe-11e7-8b4b-0242ac120002','external','\0','string',NULL);
INSERT INTO `heat_template_params` (`HEAT_TEMPLATE_ARTIFACT_UUID`, `PARAM_NAME`, `IS_REQUIRED`, `PARAM_TYPE`, `PARAM_ALIAS`) VALUES ('4885c198-a9fe-11e7-8b4b-0242ac120002','flood_unknown_unicast','\0','string',NULL);
INSERT INTO `heat_template_params` (`HEAT_TEMPLATE_ARTIFACT_UUID`, `PARAM_NAME`, `IS_REQUIRED`, `PARAM_TYPE`, `PARAM_ALIAS`) VALUES ('4885c198-a9fe-11e7-8b4b-0242ac120002','network_name','','string',NULL);
INSERT INTO `heat_template_params` (`HEAT_TEMPLATE_ARTIFACT_UUID`, `PARAM_NAME`, `IS_REQUIRED`, `PARAM_TYPE`, `PARAM_ALIAS`) VALUES ('4885c198-a9fe-11e7-8b4b-0242ac120002','policy_refs','\0','string',NULL);
INSERT INTO `heat_template_params` (`HEAT_TEMPLATE_ARTIFACT_UUID`, `PARAM_NAME`, `IS_REQUIRED`, `PARAM_TYPE`, `PARAM_ALIAS`) VALUES ('4885c198-a9fe-11e7-8b4b-0242ac120002','policy_refsdata','\0','string',NULL);
INSERT INTO `heat_template_params` (`HEAT_TEMPLATE_ARTIFACT_UUID`, `PARAM_NAME`, `IS_REQUIRED`, `PARAM_TYPE`, `PARAM_ALIAS`) VALUES ('4885c198-a9fe-11e7-8b4b-0242ac120002','route_table_refs','\0','string',NULL);
INSERT INTO `heat_template_params` (`HEAT_TEMPLATE_ARTIFACT_UUID`, `PARAM_NAME`, `IS_REQUIRED`, `PARAM_TYPE`, `PARAM_ALIAS`) VALUES ('4885c198-a9fe-11e7-8b4b-0242ac120002','route_targets','\0','string',NULL);
INSERT INTO `heat_template_params` (`HEAT_TEMPLATE_ARTIFACT_UUID`, `PARAM_NAME`, `IS_REQUIRED`, `PARAM_TYPE`, `PARAM_ALIAS`) VALUES ('4885c198-a9fe-11e7-8b4b-0242ac120002','shared','\0','string',NULL);
INSERT INTO `heat_template_params` (`HEAT_TEMPLATE_ARTIFACT_UUID`, `PARAM_NAME`, `IS_REQUIRED`, `PARAM_TYPE`, `PARAM_ALIAS`) VALUES ('4885c198-a9fe-11e7-8b4b-0242ac120002','virtual_network_properties_allow_transit','\0','string',NULL);
INSERT INTO `heat_template_params` (`HEAT_TEMPLATE_ARTIFACT_UUID`, `PARAM_NAME`, `IS_REQUIRED`, `PARAM_TYPE`, `PARAM_ALIAS`) VALUES ('4885c198-a9fe-11e7-8b4b-0242ac120002','virtual_network_properties_forwarding_mode','\0','string',NULL);
INSERT INTO `heat_template_params` (`HEAT_TEMPLATE_ARTIFACT_UUID`, `PARAM_NAME`, `IS_REQUIRED`, `PARAM_TYPE`, `PARAM_ALIAS`) VALUES ('4885c198-a9fe-11e7-8b4b-0242ac120002','virtual_network_properties_rpf','\0','string',NULL);
INSERT INTO `heat_template_params` (`HEAT_TEMPLATE_ARTIFACT_UUID`, `PARAM_NAME`, `IS_REQUIRED`, `PARAM_TYPE`, `PARAM_ALIAS`) VALUES ('4885c7a1-a9fe-11e7-8b4b-0242ac120002','external','\0','string',NULL);
INSERT INTO `heat_template_params` (`HEAT_TEMPLATE_ARTIFACT_UUID`, `PARAM_NAME`, `IS_REQUIRED`, `PARAM_TYPE`, `PARAM_ALIAS`) VALUES ('4885c7a1-a9fe-11e7-8b4b-0242ac120002','network_name','','string',NULL);
INSERT INTO `heat_template_params` (`HEAT_TEMPLATE_ARTIFACT_UUID`, `PARAM_NAME`, `IS_REQUIRED`, `PARAM_TYPE`, `PARAM_ALIAS`) VALUES ('4885c7a1-a9fe-11e7-8b4b-0242ac120002','policy_refs','\0','string',NULL);
INSERT INTO `heat_template_params` (`HEAT_TEMPLATE_ARTIFACT_UUID`, `PARAM_NAME`, `IS_REQUIRED`, `PARAM_TYPE`, `PARAM_ALIAS`) VALUES ('4885c7a1-a9fe-11e7-8b4b-0242ac120002','policy_refsdata','\0','string',NULL);
INSERT INTO `heat_template_params` (`HEAT_TEMPLATE_ARTIFACT_UUID`, `PARAM_NAME`, `IS_REQUIRED`, `PARAM_TYPE`, `PARAM_ALIAS`) VALUES ('4885c7a1-a9fe-11e7-8b4b-0242ac120002','route_table_refs','\0','string',NULL);
INSERT INTO `heat_template_params` (`HEAT_TEMPLATE_ARTIFACT_UUID`, `PARAM_NAME`, `IS_REQUIRED`, `PARAM_TYPE`, `PARAM_ALIAS`) VALUES ('4885c7a1-a9fe-11e7-8b4b-0242ac120002','route_targets','\0','string',NULL);
INSERT INTO `heat_template_params` (`HEAT_TEMPLATE_ARTIFACT_UUID`, `PARAM_NAME`, `IS_REQUIRED`, `PARAM_TYPE`, `PARAM_ALIAS`) VALUES ('4885c7a1-a9fe-11e7-8b4b-0242ac120002','shared','\0','string',NULL);
INSERT INTO `heat_template_params` (`HEAT_TEMPLATE_ARTIFACT_UUID`, `PARAM_NAME`, `IS_REQUIRED`, `PARAM_TYPE`, `PARAM_ALIAS`) VALUES ('4885c7a1-a9fe-11e7-8b4b-0242ac120002','virtual_network_properties_rpf','\0','string',NULL);

INSERT INTO `network_recipe` (`id`, `MODEL_NAME`, `ACTION`, `DESCRIPTION`, `ORCHESTRATION_URI`, `NETWORK_PARAM_XSD`, `RECIPE_TIMEOUT`, `SERVICE_TYPE`, `CREATION_TIMESTAMP`, `VERSION_STR`) VALUES (1,'CONTRAIL_BASIC','CREATE',NULL,'/mso/async/services/CreateNetworkV2',NULL,180,NULL,'2017-10-05 18:52:03','1');
INSERT INTO `network_recipe` (`id`, `MODEL_NAME`, `ACTION`, `DESCRIPTION`, `ORCHESTRATION_URI`, `NETWORK_PARAM_XSD`, `RECIPE_TIMEOUT`, `SERVICE_TYPE`, `CREATION_TIMESTAMP`, `VERSION_STR`) VALUES (2,'CONTRAIL_BASIC','DELETE',NULL,'/mso/async/services/DeleteNetworkV2',NULL,180,NULL,'2017-10-05 18:52:03','1');
INSERT INTO `network_recipe` (`id`, `MODEL_NAME`, `ACTION`, `DESCRIPTION`, `ORCHESTRATION_URI`, `NETWORK_PARAM_XSD`, `RECIPE_TIMEOUT`, `SERVICE_TYPE`, `CREATION_TIMESTAMP`, `VERSION_STR`) VALUES (3,'CONTRAIL_BASIC','UPDATE',NULL,'/mso/async/services/UpdateNetworkV2',NULL,180,NULL,'2017-10-05 18:52:03','1');
INSERT INTO `network_recipe` (`id`, `MODEL_NAME`, `ACTION`, `DESCRIPTION`, `ORCHESTRATION_URI`, `NETWORK_PARAM_XSD`, `RECIPE_TIMEOUT`, `SERVICE_TYPE`, `CREATION_TIMESTAMP`, `VERSION_STR`) VALUES (4,'CONTRAIL_SHARED','CREATE',NULL,'/mso/async/services/CreateNetworkV2',NULL,180,NULL,'2017-10-05 18:52:03','1');
INSERT INTO `network_recipe` (`id`, `MODEL_NAME`, `ACTION`, `DESCRIPTION`, `ORCHESTRATION_URI`, `NETWORK_PARAM_XSD`, `RECIPE_TIMEOUT`, `SERVICE_TYPE`, `CREATION_TIMESTAMP`, `VERSION_STR`) VALUES (5,'CONTRAIL_SHARED','UPDATE',NULL,'/mso/async/services/UpdateNetworkV2',NULL,180,NULL,'2017-10-05 18:52:03','1');
INSERT INTO `network_recipe` (`id`, `MODEL_NAME`, `ACTION`, `DESCRIPTION`, `ORCHESTRATION_URI`, `NETWORK_PARAM_XSD`, `RECIPE_TIMEOUT`, `SERVICE_TYPE`, `CREATION_TIMESTAMP`, `VERSION_STR`) VALUES (6,'CONTRAIL_SHARED','DELETE',NULL,'/mso/async/services/DeleteNetworkV2',NULL,180,NULL,'2017-10-05 18:52:03','1');
INSERT INTO `network_recipe` (`id`, `MODEL_NAME`, `ACTION`, `DESCRIPTION`, `ORCHESTRATION_URI`, `NETWORK_PARAM_XSD`, `RECIPE_TIMEOUT`, `SERVICE_TYPE`, `CREATION_TIMESTAMP`, `VERSION_STR`) VALUES (7,'CONTRAIL_EXTERNAL','CREATE',NULL,'/mso/async/services/CreateNetworkV2',NULL,180,NULL,'2017-10-05 18:52:03','1');
INSERT INTO `network_recipe` (`id`, `MODEL_NAME`, `ACTION`, `DESCRIPTION`, `ORCHESTRATION_URI`, `NETWORK_PARAM_XSD`, `RECIPE_TIMEOUT`, `SERVICE_TYPE`, `CREATION_TIMESTAMP`, `VERSION_STR`) VALUES (8,'CONTRAIL_EXTERNAL','UPDATE',NULL,'/mso/async/services/UpdateNetworkV2',NULL,180,NULL,'2017-10-05 18:52:03','1');
INSERT INTO `network_recipe` (`id`, `MODEL_NAME`, `ACTION`, `DESCRIPTION`, `ORCHESTRATION_URI`, `NETWORK_PARAM_XSD`, `RECIPE_TIMEOUT`, `SERVICE_TYPE`, `CREATION_TIMESTAMP`, `VERSION_STR`) VALUES (9,'CONTRAIL_EXTERNAL','DELETE',NULL,'/mso/async/services/DeleteNetworkV2',NULL,180,NULL,'2017-10-05 18:52:03','1');
INSERT INTO `network_recipe` (`id`, `MODEL_NAME`, `ACTION`, `DESCRIPTION`, `ORCHESTRATION_URI`, `NETWORK_PARAM_XSD`, `RECIPE_TIMEOUT`, `SERVICE_TYPE`, `CREATION_TIMESTAMP`, `VERSION_STR`) VALUES (10,'CONTRAIL30_BASIC','CREATE',NULL,'/mso/async/services/CreateNetworkV2',NULL,180,NULL,'2017-10-05 18:52:03','1');
INSERT INTO `network_recipe` (`id`, `MODEL_NAME`, `ACTION`, `DESCRIPTION`, `ORCHESTRATION_URI`, `NETWORK_PARAM_XSD`, `RECIPE_TIMEOUT`, `SERVICE_TYPE`, `CREATION_TIMESTAMP`, `VERSION_STR`) VALUES (11,'CONTRAIL30_BASIC','UPDATE',NULL,'/mso/async/services/UpdateNetworkV2',NULL,180,NULL,'2017-10-05 18:52:03','1');
INSERT INTO `network_recipe` (`id`, `MODEL_NAME`, `ACTION`, `DESCRIPTION`, `ORCHESTRATION_URI`, `NETWORK_PARAM_XSD`, `RECIPE_TIMEOUT`, `SERVICE_TYPE`, `CREATION_TIMESTAMP`, `VERSION_STR`) VALUES (12,'CONTRAIL30_BASIC','DELETE',NULL,'/mso/async/services/DeleteNetworkV2',NULL,180,NULL,'2017-10-05 18:52:03','1');
INSERT INTO `network_recipe` (`id`, `MODEL_NAME`, `ACTION`, `DESCRIPTION`, `ORCHESTRATION_URI`, `NETWORK_PARAM_XSD`, `RECIPE_TIMEOUT`, `SERVICE_TYPE`, `CREATION_TIMESTAMP`, `VERSION_STR`) VALUES (13,'CONTRAIL30_MPSCE','CREATE',NULL,'/mso/async/services/CreateNetworkV2',NULL,180,NULL,'2017-10-05 18:52:03','1');
INSERT INTO `network_recipe` (`id`, `MODEL_NAME`, `ACTION`, `DESCRIPTION`, `ORCHESTRATION_URI`, `NETWORK_PARAM_XSD`, `RECIPE_TIMEOUT`, `SERVICE_TYPE`, `CREATION_TIMESTAMP`, `VERSION_STR`) VALUES (14,'CONTRAIL30_MPSCE','UPDATE',NULL,'/mso/async/services/UpdateNetworkV2',NULL,180,NULL,'2017-10-05 18:52:03','1');
INSERT INTO `network_recipe` (`id`, `MODEL_NAME`, `ACTION`, `DESCRIPTION`, `ORCHESTRATION_URI`, `NETWORK_PARAM_XSD`, `RECIPE_TIMEOUT`, `SERVICE_TYPE`, `CREATION_TIMESTAMP`, `VERSION_STR`) VALUES (15,'CONTRAIL30_MPSCE','DELETE',NULL,'/mso/async/services/DeleteNetworkV2',NULL,180,NULL,'2017-10-05 18:52:03','1');
INSERT INTO `network_recipe` (`id`, `MODEL_NAME`, `ACTION`, `DESCRIPTION`, `ORCHESTRATION_URI`, `NETWORK_PARAM_XSD`, `RECIPE_TIMEOUT`, `SERVICE_TYPE`, `CREATION_TIMESTAMP`, `VERSION_STR`) VALUES (16,'VID_DEFAULT','createInstance','VID_DEFAULT recipe to create network if no custom BPMN flow is found','/mso/async/services/CreateNetworkInstance',NULL,180,NULL,'2017-10-05 18:52:03','1.0');
INSERT INTO `network_recipe` (`id`, `MODEL_NAME`, `ACTION`, `DESCRIPTION`, `ORCHESTRATION_URI`, `NETWORK_PARAM_XSD`, `RECIPE_TIMEOUT`, `SERVICE_TYPE`, `CREATION_TIMESTAMP`, `VERSION_STR`) VALUES (17,'VID_DEFAULT','updateInstance','VID_DEFAULT recipe to update network if no custom BPMN flow is found','/mso/async/services/UpdateNetworkInstance',NULL,180,NULL,'2017-10-05 18:52:03','1.0');
INSERT INTO `network_recipe` (`id`, `MODEL_NAME`, `ACTION`, `DESCRIPTION`, `ORCHESTRATION_URI`, `NETWORK_PARAM_XSD`, `RECIPE_TIMEOUT`, `SERVICE_TYPE`, `CREATION_TIMESTAMP`, `VERSION_STR`) VALUES (18,'VID_DEFAULT','deleteInstance','VID_DEFAULT recipe to delete network if no custom BPMN flow is found','/mso/async/services/DeleteNetworkInstance',NULL,180,NULL,'2017-10-05 18:52:03','1.0');
INSERT INTO `network_recipe` (`id`, `MODEL_NAME`, `ACTION`, `DESCRIPTION`, `ORCHESTRATION_URI`, `NETWORK_PARAM_XSD`, `RECIPE_TIMEOUT`, `SERVICE_TYPE`, `CREATION_TIMESTAMP`, `VERSION_STR`) VALUES (19,'CONTRAIL30_L2NODHCP','CREATE',NULL,'/mso/async/services/CreateNetworkV2',NULL,180,NULL,'2017-10-05 18:52:03','1');
INSERT INTO `network_recipe` (`id`, `MODEL_NAME`, `ACTION`, `DESCRIPTION`, `ORCHESTRATION_URI`, `NETWORK_PARAM_XSD`, `RECIPE_TIMEOUT`, `SERVICE_TYPE`, `CREATION_TIMESTAMP`, `VERSION_STR`) VALUES (20,'CONTRAIL30_L2NODHCP','UPDATE',NULL,'/mso/async/services/UpdateNetworkV2',NULL,180,NULL,'2017-10-05 18:52:03','1');
INSERT INTO `network_recipe` (`id`, `MODEL_NAME`, `ACTION`, `DESCRIPTION`, `ORCHESTRATION_URI`, `NETWORK_PARAM_XSD`, `RECIPE_TIMEOUT`, `SERVICE_TYPE`, `CREATION_TIMESTAMP`, `VERSION_STR`) VALUES (21,'CONTRAIL30_L2NODHCP','DELETE',NULL,'/mso/async/services/DeleteNetworkV2',NULL,180,NULL,'2017-10-05 18:52:03','1');
INSERT INTO `network_recipe` (`id`, `MODEL_NAME`, `ACTION`, `DESCRIPTION`, `ORCHESTRATION_URI`, `NETWORK_PARAM_XSD`, `RECIPE_TIMEOUT`, `SERVICE_TYPE`, `CREATION_TIMESTAMP`, `VERSION_STR`) VALUES (22,'CONTRAIL30_GNDIRECT','CREATE',NULL,'/mso/async/services/CreateNetworkV2',NULL,180,NULL,'2017-10-05 18:52:03','1');
INSERT INTO `network_recipe` (`id`, `MODEL_NAME`, `ACTION`, `DESCRIPTION`, `ORCHESTRATION_URI`, `NETWORK_PARAM_XSD`, `RECIPE_TIMEOUT`, `SERVICE_TYPE`, `CREATION_TIMESTAMP`, `VERSION_STR`) VALUES (23,'CONTRAIL30_GNDIRECT','UPDATE',NULL,'/mso/async/services/UpdateNetworkV2',NULL,180,NULL,'2017-10-05 18:52:03','1');
INSERT INTO `network_recipe` (`id`, `MODEL_NAME`, `ACTION`, `DESCRIPTION`, `ORCHESTRATION_URI`, `NETWORK_PARAM_XSD`, `RECIPE_TIMEOUT`, `SERVICE_TYPE`, `CREATION_TIMESTAMP`, `VERSION_STR`) VALUES (24,'CONTRAIL30_GNDIRECT','DELETE',NULL,'/mso/async/services/DeleteNetworkV2',NULL,180,NULL,'2017-10-05 18:52:03','1');

INSERT INTO `service` (`MODEL_UUID`, `MODEL_NAME`, `MODEL_INVARIANT_UUID`, `MODEL_VERSION`, `DESCRIPTION`, `CREATION_TIMESTAMP`, `TOSCA_CSAR_ARTIFACT_UUID`) VALUES ('48cc36cc-a9fe-11e7-8b4b-0242ac120002','VID_DEFAULT','48cd56c8-a9fe-11e7-8b4b-0242ac120002','1.0','Default service for VID to use for infra APIH orchestration1707MIGRATED1707MIGRATED','2017-10-05 18:52:03',NULL);
INSERT INTO `service` (`MODEL_UUID`, `MODEL_NAME`, `MODEL_INVARIANT_UUID`, `MODEL_VERSION`, `DESCRIPTION`, `CREATION_TIMESTAMP`, `TOSCA_CSAR_ARTIFACT_UUID`) VALUES ('48cc3acd-a9fe-11e7-8b4b-0242ac120002','*','48ce2256-a9fe-11e7-8b4b-0242ac120002','1.0','Default service to use for infra APIH orchestration1707MIGRATED1707MIGRATED','2017-10-05 18:52:03',NULL);

INSERT INTO `service_recipe` (`id`, `ACTION`, `VERSION_STR`, `DESCRIPTION`, `ORCHESTRATION_URI`, `SERVICE_PARAM_XSD`, `RECIPE_TIMEOUT`, `SERVICE_TIMEOUT_INTERIM`, `CREATION_TIMESTAMP`, `SERVICE_MODEL_UUID`) VALUES (1,'createInstance','1','VID_DEFAULT recipe to create service-instance if no custom BPMN flow is found','/mso/async/services/CreateGenericALaCarteServiceInstance',NULL,180,NULL,'2017-10-05 18:52:03','48cc36cc-a9fe-11e7-8b4b-0242ac120002');
INSERT INTO `service_recipe` (`id`, `ACTION`, `VERSION_STR`, `DESCRIPTION`, `ORCHESTRATION_URI`, `SERVICE_PARAM_XSD`, `RECIPE_TIMEOUT`, `SERVICE_TIMEOUT_INTERIM`, `CREATION_TIMESTAMP`, `SERVICE_MODEL_UUID`) VALUES (2,'deleteInstance','1','VID_DEFAULT recipe to delete service-instance if no custom BPMN flow is found','/mso/async/services/DeleteGenericALaCarteServiceInstance',NULL,180,NULL,'2017-10-05 18:52:03','48cc36cc-a9fe-11e7-8b4b-0242ac120002');
INSERT INTO `service_recipe` (`id`, `ACTION`, `VERSION_STR`, `DESCRIPTION`, `ORCHESTRATION_URI`, `SERVICE_PARAM_XSD`, `RECIPE_TIMEOUT`, `SERVICE_TIMEOUT_INTERIM`, `CREATION_TIMESTAMP`, `SERVICE_MODEL_UUID`) VALUES (3,'createInstance','1','DEFAULT recipe to create service-instance if no custom BPMN flow is found','/mso/async/services/CreateGenericALaCarteServiceInstance',NULL,180,NULL,'2017-10-05 18:52:03','48cc3acd-a9fe-11e7-8b4b-0242ac120002');
INSERT INTO `service_recipe` (`id`, `ACTION`, `VERSION_STR`, `DESCRIPTION`, `ORCHESTRATION_URI`, `SERVICE_PARAM_XSD`, `RECIPE_TIMEOUT`, `SERVICE_TIMEOUT_INTERIM`, `CREATION_TIMESTAMP`, `SERVICE_MODEL_UUID`) VALUES (4,'deleteInstance','1','DEFAULT recipe to delete service-instance if no custom BPMN flow is found','/mso/async/services/DeleteGenericALaCarteServiceInstance',NULL,180,NULL,'2017-10-05 18:52:03','48cc3acd-a9fe-11e7-8b4b-0242ac120002');

--
-- Custom Reciepe for the VoLTE service added temporarily
--

INSERT INTO `service` (`MODEL_UUID`, `MODEL_NAME`, `MODEL_INVARIANT_UUID`, `MODEL_VERSION`, `DESCRIPTION`, `CREATION_TIMESTAMP`, `TOSCA_CSAR_ARTIFACT_UUID`) VALUES ('dfcd7471-16c7-444e-8268-d4c50d90593a','UUI_DEFAULT','dfcd7471-16c7-444e-8268-d4c50d90593a','1.0','Default service for UUI to use for infra APIH orchestration1707MIGRATED1707MIGRATED','2017-10-23 18:52:03',NULL);

INSERT INTO `service_recipe` (`id`, `ACTION`, `VERSION_STR`, `DESCRIPTION`, `ORCHESTRATION_URI`, `SERVICE_PARAM_XSD`, `RECIPE_TIMEOUT`, `SERVICE_TIMEOUT_INTERIM`, `CREATION_TIMESTAMP`, `SERVICE_MODEL_UUID`) VALUES (11,'createInstance','1','Custom recipe to create E2E service-instance if no custom BPMN flow is found','/mso/async/services/CreateCustomE2EServiceInstance',NULL,180,NULL,'2017-10-05 18:52:03','dfcd7471-16c7-444e-8268-d4c50d90593a');
INSERT INTO `service_recipe` (`id`, `ACTION`, `VERSION_STR`, `DESCRIPTION`, `ORCHESTRATION_URI`, `SERVICE_PARAM_XSD`, `RECIPE_TIMEOUT`, `SERVICE_TIMEOUT_INTERIM`, `CREATION_TIMESTAMP`, `SERVICE_MODEL_UUID`) VALUES (12,'deleteInstance','1','Custom recipe to delete E2E service-instance if no custom BPMN flow is found','/mso/async/services/DeleteCustomE2EServiceInstance',NULL,180,NULL,'2017-10-05 18:52:03','dfcd7471-16c7-444e-8268-d4c50d90593a');

INSERT INTO `temp_network_heat_template_lookup` (`NETWORK_RESOURCE_MODEL_NAME`, `HEAT_TEMPLATE_ARTIFACT_UUID`, `AIC_VERSION_MIN`, `AIC_VERSION_MAX`) VALUES ('CONTRAIL30_GNDIRECT','4885c7a1-a9fe-11e7-8b4b-0242ac120002','3.0',NULL);
INSERT INTO `temp_network_heat_template_lookup` (`NETWORK_RESOURCE_MODEL_NAME`, `HEAT_TEMPLATE_ARTIFACT_UUID`, `AIC_VERSION_MIN`, `AIC_VERSION_MAX`) VALUES ('CONTRAIL30_L2NODHCP','4885c198-a9fe-11e7-8b4b-0242ac120002','3.0',NULL);
INSERT INTO `temp_network_heat_template_lookup` (`NETWORK_RESOURCE_MODEL_NAME`, `HEAT_TEMPLATE_ARTIFACT_UUID`,`AIC_VERSION_MIN` , `AIC_VERSION_MAX` ) VALUES ('Generic NeutronNet','efee1d84-b8ec-11e7-abc4-cec278b6b50a','2.0','NULL');

INSERT INTO `vnf_components_recipe` (`id`, `VNF_TYPE`, `VNF_COMPONENT_TYPE`, `VF_MODULE_MODEL_UUID`, `ACTION`, `SERVICE_TYPE`, `VERSION`, `DESCRIPTION`, `ORCHESTRATION_URI`, `VNF_COMPONENT_PARAM_XSD`, `RECIPE_TIMEOUT`, `CREATION_TIMESTAMP`) VALUES (1,'*','VOLUME_GROUP',NULL,'CREATE',NULL,'1','Recipe Match All for','/mso/async/services/createCinderVolumeV1',null,180,'2017-10-05 18:52:03');
INSERT INTO `vnf_components_recipe` (`id`, `VNF_TYPE`, `VNF_COMPONENT_TYPE`, `VF_MODULE_MODEL_UUID`, `ACTION`, `SERVICE_TYPE`, `VERSION`, `DESCRIPTION`, `ORCHESTRATION_URI`, `VNF_COMPONENT_PARAM_XSD`, `RECIPE_TIMEOUT`, `CREATION_TIMESTAMP`) VALUES (2,'*','VOLUME_GROUP',NULL,'DELETE',NULL,'1','Recipe Match All for','/mso/async/services/deleteCinderVolumeV1',null,180,'2017-10-05 18:52:03');
INSERT INTO `vnf_components_recipe` (`id`, `VNF_TYPE`, `VNF_COMPONENT_TYPE`, `VF_MODULE_MODEL_UUID`, `ACTION`, `SERVICE_TYPE`, `VERSION`, `DESCRIPTION`, `ORCHESTRATION_URI`, `VNF_COMPONENT_PARAM_XSD`, `RECIPE_TIMEOUT`, `CREATION_TIMESTAMP`) VALUES (3,'*','VOLUME_GROUP',NULL,'UPDATE',NULL,'1','Recipe Match All for','/mso/async/services/updateCinderVolumeV1',null,180,'2017-10-05 18:52:03');
INSERT INTO `vnf_components_recipe` (`id`, `VNF_TYPE`, `VNF_COMPONENT_TYPE`, `VF_MODULE_MODEL_UUID`, `ACTION`, `SERVICE_TYPE`, `VERSION`, `DESCRIPTION`, `ORCHESTRATION_URI`, `VNF_COMPONENT_PARAM_XSD`, `RECIPE_TIMEOUT`, `CREATION_TIMESTAMP`) VALUES (4,NULL,'VOLUME_GROUP',NULL,'CREATE_VF_MODULE_VOL',NULL,'1','Recipe Match All for','/mso/async/services/CreateVfModuleVolume',null,180,'2017-10-05 18:52:03');
INSERT INTO `vnf_components_recipe` (`id`, `VNF_TYPE`, `VNF_COMPONENT_TYPE`, `VF_MODULE_MODEL_UUID`, `ACTION`, `SERVICE_TYPE`, `VERSION`, `DESCRIPTION`, `ORCHESTRATION_URI`, `VNF_COMPONENT_PARAM_XSD`, `RECIPE_TIMEOUT`, `CREATION_TIMESTAMP`) VALUES (5,NULL,'VOLUME_GROUP',NULL,'DELETE_VF_MODULE_VOL',NULL,'1','Recipe Match All for','/mso/async/services/DeleteVfModuleVolume',null,180,'2017-10-05 18:52:03');
INSERT INTO `vnf_components_recipe` (`id`, `VNF_TYPE`, `VNF_COMPONENT_TYPE`, `VF_MODULE_MODEL_UUID`, `ACTION`, `SERVICE_TYPE`, `VERSION`, `DESCRIPTION`, `ORCHESTRATION_URI`, `VNF_COMPONENT_PARAM_XSD`, `RECIPE_TIMEOUT`, `CREATION_TIMESTAMP`) VALUES (6,NULL,'VOLUME_GROUP',NULL,'UPDATE_VF_MODULE_VOL',NULL,'1','Recipe Match All for','/mso/async/services/UpdateVfModuleVolume',null,180,'2017-10-05 18:52:03');
INSERT INTO `vnf_components_recipe` (`id`, `VNF_TYPE`, `VNF_COMPONENT_TYPE`, `VF_MODULE_MODEL_UUID`, `ACTION`, `SERVICE_TYPE`, `VERSION`, `DESCRIPTION`, `ORCHESTRATION_URI`, `VNF_COMPONENT_PARAM_XSD`, `RECIPE_TIMEOUT`, `CREATION_TIMESTAMP`) VALUES (7,NULL,'volumeGroup','VID_DEFAULT','createInstance',NULL,'1','VID_DEFAULT recipe t','/mso/async/services/CreateVfModuleVolumeInfraV1',null,180,'2017-10-05 18:52:03');
INSERT INTO `vnf_components_recipe` (`id`, `VNF_TYPE`, `VNF_COMPONENT_TYPE`, `VF_MODULE_MODEL_UUID`, `ACTION`, `SERVICE_TYPE`, `VERSION`, `DESCRIPTION`, `ORCHESTRATION_URI`, `VNF_COMPONENT_PARAM_XSD`, `RECIPE_TIMEOUT`, `CREATION_TIMESTAMP`) VALUES (8,NULL,'volumeGroup','VID_DEFAULT','deleteInstance',NULL,'1','VID_DEFAULT recipe t','/mso/async/services/DeleteVfModuleVolumeInfraV1',null,180,'2017-10-05 18:52:03');
INSERT INTO `vnf_components_recipe` (`id`, `VNF_TYPE`, `VNF_COMPONENT_TYPE`, `VF_MODULE_MODEL_UUID`, `ACTION`, `SERVICE_TYPE`, `VERSION`, `DESCRIPTION`, `ORCHESTRATION_URI`, `VNF_COMPONENT_PARAM_XSD`, `RECIPE_TIMEOUT`, `CREATION_TIMESTAMP`) VALUES (9,NULL,'volumeGroup','VID_DEFAULT','updateInstance',NULL,'1','VID_DEFAULT recipe t','/mso/async/services/UpdateVfModuleVolumeInfraV1',null,180,'2017-10-05 18:52:03');
INSERT INTO `vnf_components_recipe` (`id`, `VNF_TYPE`, `VNF_COMPONENT_TYPE`, `VF_MODULE_MODEL_UUID`, `ACTION`, `SERVICE_TYPE`, `VERSION`, `DESCRIPTION`, `ORCHESTRATION_URI`, `VNF_COMPONENT_PARAM_XSD`, `RECIPE_TIMEOUT`, `CREATION_TIMESTAMP`) VALUES (10,NULL,'vfModule','VID_DEFAULT','createInstance',NULL,'1','VID_DEFAULT recipe t','/mso/async/services/CreateVfModuleInfra',null,180,'2017-10-05 18:52:03');
INSERT INTO `vnf_components_recipe` (`id`, `VNF_TYPE`, `VNF_COMPONENT_TYPE`, `VF_MODULE_MODEL_UUID`, `ACTION`, `SERVICE_TYPE`, `VERSION`, `DESCRIPTION`, `ORCHESTRATION_URI`, `VNF_COMPONENT_PARAM_XSD`, `RECIPE_TIMEOUT`, `CREATION_TIMESTAMP`) VALUES (11,NULL,'vfModule','VID_DEFAULT','deleteInstance',NULL,'1','VID_DEFAULT recipe t','/mso/async/services/DeleteVfModuleInfra',null,180,'2017-10-05 18:52:03');
INSERT INTO `vnf_components_recipe` (`id`, `VNF_TYPE`, `VNF_COMPONENT_TYPE`, `VF_MODULE_MODEL_UUID`, `ACTION`, `SERVICE_TYPE`, `VERSION`, `DESCRIPTION`, `ORCHESTRATION_URI`, `VNF_COMPONENT_PARAM_XSD`, `RECIPE_TIMEOUT`, `CREATION_TIMESTAMP`) VALUES (12,NULL,'vfModule','VID_DEFAULT','updateInstance',NULL,'1','VID_DEFAULT recipe t','/mso/async/services/UpdateVfModuleInfra',null,180,'2017-10-05 18:52:03');

--
-- Default Reciepe for the VNF componnets added start #SO-334, to unblock the VNF operations
--

INSERT INTO `vnf_components_recipe` (`VNF_TYPE`, `VF_MODULE_MODEL_UUID`, `ACTION`, `VERSION`, `DESCRIPTION`, `ORCHESTRATION_URI`,`VNF_COMPONENT_TYPE`, `VNF_COMPONENT_PARAM_XSD`, `RECIPE_TIMEOUT`, `SERVICE_TYPE`) VALUES  (NULL,'POLICY_DEFAULT','createInstance','1','Recipe Match POLICY_DEFAULT for VF Modules if no custom flow exists','/mso/async/services/CreateVfModuleInfra','vfModule',NULL,180,NULL);
INSERT INTO `vnf_components_recipe` (`VNF_TYPE`, `VF_MODULE_MODEL_UUID`, `ACTION`, `VERSION`, `DESCRIPTION`, `ORCHESTRATION_URI`,`VNF_COMPONENT_TYPE`, `VNF_COMPONENT_PARAM_XSD`, `RECIPE_TIMEOUT`, `SERVICE_TYPE`) VALUES (NULL,'POLICY_DEFAULT','updateInstance','1','Recipe Match POLICY_DEFAULT for VF Modules if no custom flow exists','/mso/async/services/UpdateVfModuleInfra','vfModule',NULL,180,NULL);
INSERT INTO `vnf_components_recipe` (`VNF_TYPE`, `VF_MODULE_MODEL_UUID`, `ACTION`, `VERSION`, `DESCRIPTION`, `ORCHESTRATION_URI`,`VNF_COMPONENT_TYPE`, `VNF_COMPONENT_PARAM_XSD`, `RECIPE_TIMEOUT`, `SERVICE_TYPE`) VALUES (NULL,'POLICY_DEFAULT','deleteInstance','1','Recipe Match POLICY_DEFAULT for VF Modules if no custom flow exists','/mso/async/services/DeleteVfModuleInfra','vfModule',NULL,180,NULL);
--
-- Default Reciepe for the VNF componnets added End
--

INSERT INTO `vnf_recipe` (`id`, `VF_MODULE_ID`, `ACTION`, `SERVICE_TYPE`, `VERSION_STR`, `VNF_TYPE`, `DESCRIPTION`, `ORCHESTRATION_URI`, `VNF_PARAM_XSD`, `RECIPE_TIMEOUT`, `CREATION_TIMESTAMP`) VALUES (1,NULL,'CREATE',NULL,'1','*','Recipe Match All for VNFs if no custom flow exists','/mso/workflow/services/CreateGenericVNFV1',NULL,180,'2017-10-05 18:52:03');
INSERT INTO `vnf_recipe` (`id`, `VF_MODULE_ID`, `ACTION`, `SERVICE_TYPE`, `VERSION_STR`, `VNF_TYPE`, `DESCRIPTION`, `ORCHESTRATION_URI`, `VNF_PARAM_XSD`, `RECIPE_TIMEOUT`, `CREATION_TIMESTAMP`) VALUES (2,NULL,'DELETE',NULL,'1','*','Recipe Match All for VNFs if no custom flow exists','/mso/async/services//deleteGenericVNFV1',NULL,180,'2017-10-05 18:52:03');
INSERT INTO `vnf_recipe` (`id`, `VF_MODULE_ID`, `ACTION`, `SERVICE_TYPE`, `VERSION_STR`, `VNF_TYPE`, `DESCRIPTION`, `ORCHESTRATION_URI`, `VNF_PARAM_XSD`, `RECIPE_TIMEOUT`, `CREATION_TIMESTAMP`) VALUES (3,NULL,'UPDATE',NULL,'1','*','Recipe Match All for VNFs if no custom flow exists','/mso/workflow/services/updateGenericVNFV1',NULL,180,'2017-10-05 18:52:03');
INSERT INTO `vnf_recipe` (`id`, `VF_MODULE_ID`, `ACTION`, `SERVICE_TYPE`, `VERSION_STR`, `VNF_TYPE`, `DESCRIPTION`, `ORCHESTRATION_URI`, `VNF_PARAM_XSD`, `RECIPE_TIMEOUT`, `CREATION_TIMESTAMP`) VALUES (4,'*','CREATE_VF_MODULE',NULL,'1',NULL,'Recipe Match All for VNFs if no custom flow exists','/mso/async/services/CreateVfModule',NULL,180,'2017-10-05 18:52:03');
INSERT INTO `vnf_recipe` (`id`, `VF_MODULE_ID`, `ACTION`, `SERVICE_TYPE`, `VERSION_STR`, `VNF_TYPE`, `DESCRIPTION`, `ORCHESTRATION_URI`, `VNF_PARAM_XSD`, `RECIPE_TIMEOUT`, `CREATION_TIMESTAMP`) VALUES (5,'*','DELETE_VF_MODULE',NULL,'1',NULL,'Recipe Match All for VNFs if no custom flow exists','/mso/async/services/DeleteVfModule',NULL,180,'2017-10-05 18:52:03');
INSERT INTO `vnf_recipe` (`id`, `VF_MODULE_ID`, `ACTION`, `SERVICE_TYPE`, `VERSION_STR`, `VNF_TYPE`, `DESCRIPTION`, `ORCHESTRATION_URI`, `VNF_PARAM_XSD`, `RECIPE_TIMEOUT`, `CREATION_TIMESTAMP`) VALUES (6,'*','UPDATE_VF_MODULE',NULL,'1',NULL,'Recipe Match All for VNFs if no custom flow exists','/mso/async/services/UpdateVfModule',NULL,180,'2017-10-05 18:52:03');
INSERT INTO `vnf_recipe` (`id`, `VF_MODULE_ID`, `ACTION`, `SERVICE_TYPE`, `VERSION_STR`, `VNF_TYPE`, `DESCRIPTION`, `ORCHESTRATION_URI`, `VNF_PARAM_XSD`, `RECIPE_TIMEOUT`, `CREATION_TIMESTAMP`) VALUES (7,NULL,'createInstance',NULL,'1','VID_DEFAULT','VID_DEFAULT recipe to create VNF if no custom BPMN flow is found','/mso/async/services/CreateVnfInfra',NULL,180,'2017-10-05 18:52:03');
INSERT INTO `vnf_recipe` (`id`, `VF_MODULE_ID`, `ACTION`, `SERVICE_TYPE`, `VERSION_STR`, `VNF_TYPE`, `DESCRIPTION`, `ORCHESTRATION_URI`, `VNF_PARAM_XSD`, `RECIPE_TIMEOUT`, `CREATION_TIMESTAMP`) VALUES (8,NULL,'deleteInstance',NULL,'1','VID_DEFAULT','VID_DEFAULT recipe to delete VNF if no custom BPMN flow is found','/mso/async/services/DeleteVnfInfra',NULL,180,'2017-10-05 18:52:03');

SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
