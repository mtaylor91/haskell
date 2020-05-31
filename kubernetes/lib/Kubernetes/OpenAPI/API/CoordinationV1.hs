{-
   Kubernetes

   No description provided (generated by Openapi Generator https://github.com/openapitools/openapi-generator)

   OpenAPI Version: 3.0.1
   Kubernetes API version: v1.18.3
   Generated by OpenAPI Generator (https://openapi-generator.tech)
-}

{-|
Module : Kubernetes.OpenAPI.API.CoordinationV1
-}

{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MonoLocalBinds #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -fno-warn-name-shadowing -fno-warn-unused-binds -fno-warn-unused-imports #-}

module Kubernetes.OpenAPI.API.CoordinationV1 where

import Kubernetes.OpenAPI.Core
import Kubernetes.OpenAPI.MimeTypes
import Kubernetes.OpenAPI.Model as M

import qualified Data.Aeson as A
import qualified Data.ByteString as B
import qualified Data.ByteString.Lazy as BL
import qualified Data.Data as P (Typeable, TypeRep, typeOf, typeRep)
import qualified Data.Foldable as P
import qualified Data.Map as Map
import qualified Data.Maybe as P
import qualified Data.Proxy as P (Proxy(..))
import qualified Data.Set as Set
import qualified Data.String as P
import qualified Data.Text as T
import qualified Data.Text.Encoding as T
import qualified Data.Text.Lazy as TL
import qualified Data.Text.Lazy.Encoding as TL
import qualified Data.Time as TI
import qualified Network.HTTP.Client.MultipartFormData as NH
import qualified Network.HTTP.Media as ME
import qualified Network.HTTP.Types as NH
import qualified Web.FormUrlEncoded as WH
import qualified Web.HttpApiData as WH

import Data.Text (Text)
import GHC.Base ((<|>))

import Prelude ((==),(/=),($), (.),(<$>),(<*>),(>>=),Maybe(..),Bool(..),Char,Double,FilePath,Float,Int,Integer,String,fmap,undefined,mempty,maybe,pure,Monad,Applicative,Functor)
import qualified Prelude as P

-- * Operations


-- ** CoordinationV1

-- *** createNamespacedLease

-- | @POST \/apis\/coordination.k8s.io\/v1\/namespaces\/{namespace}\/leases@
-- 
-- create a Lease
-- 
-- AuthMethod: 'AuthApiKeyBearerToken'
-- 
createNamespacedLease 
  :: (Consumes CreateNamespacedLease contentType, MimeRender contentType V1Lease)
  => ContentType contentType -- ^ request content-type ('MimeType')
  -> Accept accept -- ^ request accept ('MimeType')
  -> V1Lease -- ^ "body"
  -> Namespace -- ^ "namespace" -  object name and auth scope, such as for teams and projects
  -> KubernetesRequest CreateNamespacedLease contentType V1Lease accept
createNamespacedLease _  _ body (Namespace namespace) =
  _mkRequest "POST" ["/apis/coordination.k8s.io/v1/namespaces/",toPath namespace,"/leases"]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthApiKeyBearerToken)
    `setBodyParam` body

data CreateNamespacedLease 
instance HasBodyParam CreateNamespacedLease V1Lease 

-- | /Optional Param/ "pretty" - If 'true', then the output is pretty printed.
instance HasOptionalParam CreateNamespacedLease Pretty where
  applyOptionalParam req (Pretty xs) =
    req `setQuery` toQuery ("pretty", Just xs)

-- | /Optional Param/ "dryRun" - When present, indicates that modifications should not be persisted. An invalid or unrecognized dryRun directive will result in an error response and no further processing of the request. Valid values are: - All: all dry run stages will be processed
instance HasOptionalParam CreateNamespacedLease DryRun where
  applyOptionalParam req (DryRun xs) =
    req `setQuery` toQuery ("dryRun", Just xs)

-- | /Optional Param/ "fieldManager" - fieldManager is a name associated with the actor or entity that is making these changes. The value must be less than or 128 characters long, and only contain printable characters, as defined by https://golang.org/pkg/unicode/#IsPrint.
instance HasOptionalParam CreateNamespacedLease FieldManager where
  applyOptionalParam req (FieldManager xs) =
    req `setQuery` toQuery ("fieldManager", Just xs)
    
-- | @*/*@
instance MimeType mtype => Consumes CreateNamespacedLease mtype

-- | @application/json@
instance Produces CreateNamespacedLease MimeJSON
-- | @application/vnd.kubernetes.protobuf@
instance Produces CreateNamespacedLease MimeVndKubernetesProtobuf
-- | @application/yaml@
instance Produces CreateNamespacedLease MimeYaml


-- *** deleteCollectionNamespacedLease

-- | @DELETE \/apis\/coordination.k8s.io\/v1\/namespaces\/{namespace}\/leases@
-- 
-- delete collection of Lease
-- 
-- AuthMethod: 'AuthApiKeyBearerToken'
-- 
deleteCollectionNamespacedLease 
  :: (Consumes DeleteCollectionNamespacedLease contentType)
  => ContentType contentType -- ^ request content-type ('MimeType')
  -> Accept accept -- ^ request accept ('MimeType')
  -> Namespace -- ^ "namespace" -  object name and auth scope, such as for teams and projects
  -> KubernetesRequest DeleteCollectionNamespacedLease contentType V1Status accept
deleteCollectionNamespacedLease _  _ (Namespace namespace) =
  _mkRequest "DELETE" ["/apis/coordination.k8s.io/v1/namespaces/",toPath namespace,"/leases"]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthApiKeyBearerToken)

data DeleteCollectionNamespacedLease 
instance HasBodyParam DeleteCollectionNamespacedLease V1DeleteOptions 

-- | /Optional Param/ "pretty" - If 'true', then the output is pretty printed.
instance HasOptionalParam DeleteCollectionNamespacedLease Pretty where
  applyOptionalParam req (Pretty xs) =
    req `setQuery` toQuery ("pretty", Just xs)

-- | /Optional Param/ "continue" - The continue option should be set when retrieving more results from the server. Since this value is server defined, clients may only use the continue value from a previous query result with identical query parameters (except for the value of continue) and the server may reject a continue value it does not recognize. If the specified continue value is no longer valid whether due to expiration (generally five to fifteen minutes) or a configuration change on the server, the server will respond with a 410 ResourceExpired error together with a continue token. If the client needs a consistent list, it must restart their list without the continue field. Otherwise, the client may send another list request with the token received with the 410 error, the server will respond with a list starting from the next key, but from the latest snapshot, which is inconsistent from the previous list results - objects that are created, modified, or deleted after the first list request will be included in the response, as long as their keys are after the \"next key\".  This field is not supported when watch is true. Clients may start a watch from the last resourceVersion value returned by the server and not miss any modifications.
instance HasOptionalParam DeleteCollectionNamespacedLease Continue where
  applyOptionalParam req (Continue xs) =
    req `setQuery` toQuery ("continue", Just xs)

-- | /Optional Param/ "dryRun" - When present, indicates that modifications should not be persisted. An invalid or unrecognized dryRun directive will result in an error response and no further processing of the request. Valid values are: - All: all dry run stages will be processed
instance HasOptionalParam DeleteCollectionNamespacedLease DryRun where
  applyOptionalParam req (DryRun xs) =
    req `setQuery` toQuery ("dryRun", Just xs)

-- | /Optional Param/ "fieldSelector" - A selector to restrict the list of returned objects by their fields. Defaults to everything.
instance HasOptionalParam DeleteCollectionNamespacedLease FieldSelector where
  applyOptionalParam req (FieldSelector xs) =
    req `setQuery` toQuery ("fieldSelector", Just xs)

-- | /Optional Param/ "gracePeriodSeconds" - The duration in seconds before the object should be deleted. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period for the specified type will be used. Defaults to a per object value if not specified. zero means delete immediately.
instance HasOptionalParam DeleteCollectionNamespacedLease GracePeriodSeconds where
  applyOptionalParam req (GracePeriodSeconds xs) =
    req `setQuery` toQuery ("gracePeriodSeconds", Just xs)

-- | /Optional Param/ "labelSelector" - A selector to restrict the list of returned objects by their labels. Defaults to everything.
instance HasOptionalParam DeleteCollectionNamespacedLease LabelSelector where
  applyOptionalParam req (LabelSelector xs) =
    req `setQuery` toQuery ("labelSelector", Just xs)

-- | /Optional Param/ "limit" - limit is a maximum number of responses to return for a list call. If more items exist, the server will set the `continue` field on the list metadata to a value that can be used with the same initial query to retrieve the next set of results. Setting a limit may return fewer than the requested amount of items (up to zero items) in the event all requested objects are filtered out and clients should only use the presence of the continue field to determine whether more results are available. Servers may choose not to support the limit argument and will return all of the available results. If limit is specified and the continue field is empty, clients may assume that no more results are available. This field is not supported if watch is true.  The server guarantees that the objects returned when using continue will be identical to issuing a single list call without a limit - that is, no objects created, modified, or deleted after the first request is issued will be included in any subsequent continued requests. This is sometimes referred to as a consistent snapshot, and ensures that a client that is using limit to receive smaller chunks of a very large result can ensure they see all possible objects. If objects are updated during a chunked list the version of the object that was present at the time the first list result was calculated is returned.
instance HasOptionalParam DeleteCollectionNamespacedLease Limit where
  applyOptionalParam req (Limit xs) =
    req `setQuery` toQuery ("limit", Just xs)

-- | /Optional Param/ "orphanDependents" - Deprecated: please use the PropagationPolicy, this field will be deprecated in 1.7. Should the dependent objects be orphaned. If true/false, the \"orphan\" finalizer will be added to/removed from the object's finalizers list. Either this field or PropagationPolicy may be set, but not both.
instance HasOptionalParam DeleteCollectionNamespacedLease OrphanDependents where
  applyOptionalParam req (OrphanDependents xs) =
    req `setQuery` toQuery ("orphanDependents", Just xs)

-- | /Optional Param/ "propagationPolicy" - Whether and how garbage collection will be performed. Either this field or OrphanDependents may be set, but not both. The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy. Acceptable values are: 'Orphan' - orphan the dependents; 'Background' - allow the garbage collector to delete the dependents in the background; 'Foreground' - a cascading policy that deletes all dependents in the foreground.
instance HasOptionalParam DeleteCollectionNamespacedLease PropagationPolicy where
  applyOptionalParam req (PropagationPolicy xs) =
    req `setQuery` toQuery ("propagationPolicy", Just xs)

-- | /Optional Param/ "resourceVersion" - When specified with a watch call, shows changes that occur after that particular version of a resource. Defaults to changes from the beginning of history. When specified for list: - if unset, then the result is returned from remote storage based on quorum-read flag; - if it's 0, then we simply return what we currently have in cache, no guarantee; - if set to non zero, then the result is at least as fresh as given rv.
instance HasOptionalParam DeleteCollectionNamespacedLease ResourceVersion where
  applyOptionalParam req (ResourceVersion xs) =
    req `setQuery` toQuery ("resourceVersion", Just xs)

-- | /Optional Param/ "timeoutSeconds" - Timeout for the list/watch call. This limits the duration of the call, regardless of any activity or inactivity.
instance HasOptionalParam DeleteCollectionNamespacedLease TimeoutSeconds where
  applyOptionalParam req (TimeoutSeconds xs) =
    req `setQuery` toQuery ("timeoutSeconds", Just xs)
    
-- | @*/*@
instance MimeType mtype => Consumes DeleteCollectionNamespacedLease mtype

-- | @application/json@
instance Produces DeleteCollectionNamespacedLease MimeJSON
-- | @application/vnd.kubernetes.protobuf@
instance Produces DeleteCollectionNamespacedLease MimeVndKubernetesProtobuf
-- | @application/yaml@
instance Produces DeleteCollectionNamespacedLease MimeYaml


-- *** deleteNamespacedLease

-- | @DELETE \/apis\/coordination.k8s.io\/v1\/namespaces\/{namespace}\/leases\/{name}@
-- 
-- delete a Lease
-- 
-- AuthMethod: 'AuthApiKeyBearerToken'
-- 
deleteNamespacedLease 
  :: (Consumes DeleteNamespacedLease contentType)
  => ContentType contentType -- ^ request content-type ('MimeType')
  -> Accept accept -- ^ request accept ('MimeType')
  -> Name -- ^ "name" -  name of the Lease
  -> Namespace -- ^ "namespace" -  object name and auth scope, such as for teams and projects
  -> KubernetesRequest DeleteNamespacedLease contentType V1Status accept
deleteNamespacedLease _  _ (Name name) (Namespace namespace) =
  _mkRequest "DELETE" ["/apis/coordination.k8s.io/v1/namespaces/",toPath namespace,"/leases/",toPath name]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthApiKeyBearerToken)

data DeleteNamespacedLease 
instance HasBodyParam DeleteNamespacedLease V1DeleteOptions 

-- | /Optional Param/ "pretty" - If 'true', then the output is pretty printed.
instance HasOptionalParam DeleteNamespacedLease Pretty where
  applyOptionalParam req (Pretty xs) =
    req `setQuery` toQuery ("pretty", Just xs)

-- | /Optional Param/ "dryRun" - When present, indicates that modifications should not be persisted. An invalid or unrecognized dryRun directive will result in an error response and no further processing of the request. Valid values are: - All: all dry run stages will be processed
instance HasOptionalParam DeleteNamespacedLease DryRun where
  applyOptionalParam req (DryRun xs) =
    req `setQuery` toQuery ("dryRun", Just xs)

-- | /Optional Param/ "gracePeriodSeconds" - The duration in seconds before the object should be deleted. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period for the specified type will be used. Defaults to a per object value if not specified. zero means delete immediately.
instance HasOptionalParam DeleteNamespacedLease GracePeriodSeconds where
  applyOptionalParam req (GracePeriodSeconds xs) =
    req `setQuery` toQuery ("gracePeriodSeconds", Just xs)

-- | /Optional Param/ "orphanDependents" - Deprecated: please use the PropagationPolicy, this field will be deprecated in 1.7. Should the dependent objects be orphaned. If true/false, the \"orphan\" finalizer will be added to/removed from the object's finalizers list. Either this field or PropagationPolicy may be set, but not both.
instance HasOptionalParam DeleteNamespacedLease OrphanDependents where
  applyOptionalParam req (OrphanDependents xs) =
    req `setQuery` toQuery ("orphanDependents", Just xs)

-- | /Optional Param/ "propagationPolicy" - Whether and how garbage collection will be performed. Either this field or OrphanDependents may be set, but not both. The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy. Acceptable values are: 'Orphan' - orphan the dependents; 'Background' - allow the garbage collector to delete the dependents in the background; 'Foreground' - a cascading policy that deletes all dependents in the foreground.
instance HasOptionalParam DeleteNamespacedLease PropagationPolicy where
  applyOptionalParam req (PropagationPolicy xs) =
    req `setQuery` toQuery ("propagationPolicy", Just xs)
    
-- | @*/*@
instance MimeType mtype => Consumes DeleteNamespacedLease mtype

-- | @application/json@
instance Produces DeleteNamespacedLease MimeJSON
-- | @application/vnd.kubernetes.protobuf@
instance Produces DeleteNamespacedLease MimeVndKubernetesProtobuf
-- | @application/yaml@
instance Produces DeleteNamespacedLease MimeYaml


-- *** getAPIResources

-- | @GET \/apis\/coordination.k8s.io\/v1\/@
-- 
-- get available resources
-- 
-- AuthMethod: 'AuthApiKeyBearerToken'
-- 
getAPIResources 
  :: Accept accept -- ^ request accept ('MimeType')
  -> KubernetesRequest GetAPIResources MimeNoContent V1APIResourceList accept
getAPIResources  _ =
  _mkRequest "GET" ["/apis/coordination.k8s.io/v1/"]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthApiKeyBearerToken)

data GetAPIResources  
-- | @application/json@
instance Produces GetAPIResources MimeJSON
-- | @application/vnd.kubernetes.protobuf@
instance Produces GetAPIResources MimeVndKubernetesProtobuf
-- | @application/yaml@
instance Produces GetAPIResources MimeYaml


-- *** listLeaseForAllNamespaces

-- | @GET \/apis\/coordination.k8s.io\/v1\/leases@
-- 
-- list or watch objects of kind Lease
-- 
-- AuthMethod: 'AuthApiKeyBearerToken'
-- 
listLeaseForAllNamespaces 
  :: Accept accept -- ^ request accept ('MimeType')
  -> KubernetesRequest ListLeaseForAllNamespaces MimeNoContent V1LeaseList accept
listLeaseForAllNamespaces  _ =
  _mkRequest "GET" ["/apis/coordination.k8s.io/v1/leases"]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthApiKeyBearerToken)

data ListLeaseForAllNamespaces  

-- | /Optional Param/ "allowWatchBookmarks" - allowWatchBookmarks requests watch events with type \"BOOKMARK\". Servers that do not implement bookmarks may ignore this flag and bookmarks are sent at the server's discretion. Clients should not assume bookmarks are returned at any specific interval, nor may they assume the server will send any BOOKMARK event during a session. If this is not a watch, this field is ignored. If the feature gate WatchBookmarks is not enabled in apiserver, this field is ignored.
instance HasOptionalParam ListLeaseForAllNamespaces AllowWatchBookmarks where
  applyOptionalParam req (AllowWatchBookmarks xs) =
    req `setQuery` toQuery ("allowWatchBookmarks", Just xs)

-- | /Optional Param/ "continue" - The continue option should be set when retrieving more results from the server. Since this value is server defined, clients may only use the continue value from a previous query result with identical query parameters (except for the value of continue) and the server may reject a continue value it does not recognize. If the specified continue value is no longer valid whether due to expiration (generally five to fifteen minutes) or a configuration change on the server, the server will respond with a 410 ResourceExpired error together with a continue token. If the client needs a consistent list, it must restart their list without the continue field. Otherwise, the client may send another list request with the token received with the 410 error, the server will respond with a list starting from the next key, but from the latest snapshot, which is inconsistent from the previous list results - objects that are created, modified, or deleted after the first list request will be included in the response, as long as their keys are after the \"next key\".  This field is not supported when watch is true. Clients may start a watch from the last resourceVersion value returned by the server and not miss any modifications.
instance HasOptionalParam ListLeaseForAllNamespaces Continue where
  applyOptionalParam req (Continue xs) =
    req `setQuery` toQuery ("continue", Just xs)

-- | /Optional Param/ "fieldSelector" - A selector to restrict the list of returned objects by their fields. Defaults to everything.
instance HasOptionalParam ListLeaseForAllNamespaces FieldSelector where
  applyOptionalParam req (FieldSelector xs) =
    req `setQuery` toQuery ("fieldSelector", Just xs)

-- | /Optional Param/ "labelSelector" - A selector to restrict the list of returned objects by their labels. Defaults to everything.
instance HasOptionalParam ListLeaseForAllNamespaces LabelSelector where
  applyOptionalParam req (LabelSelector xs) =
    req `setQuery` toQuery ("labelSelector", Just xs)

-- | /Optional Param/ "limit" - limit is a maximum number of responses to return for a list call. If more items exist, the server will set the `continue` field on the list metadata to a value that can be used with the same initial query to retrieve the next set of results. Setting a limit may return fewer than the requested amount of items (up to zero items) in the event all requested objects are filtered out and clients should only use the presence of the continue field to determine whether more results are available. Servers may choose not to support the limit argument and will return all of the available results. If limit is specified and the continue field is empty, clients may assume that no more results are available. This field is not supported if watch is true.  The server guarantees that the objects returned when using continue will be identical to issuing a single list call without a limit - that is, no objects created, modified, or deleted after the first request is issued will be included in any subsequent continued requests. This is sometimes referred to as a consistent snapshot, and ensures that a client that is using limit to receive smaller chunks of a very large result can ensure they see all possible objects. If objects are updated during a chunked list the version of the object that was present at the time the first list result was calculated is returned.
instance HasOptionalParam ListLeaseForAllNamespaces Limit where
  applyOptionalParam req (Limit xs) =
    req `setQuery` toQuery ("limit", Just xs)

-- | /Optional Param/ "pretty" - If 'true', then the output is pretty printed.
instance HasOptionalParam ListLeaseForAllNamespaces Pretty where
  applyOptionalParam req (Pretty xs) =
    req `setQuery` toQuery ("pretty", Just xs)

-- | /Optional Param/ "resourceVersion" - When specified with a watch call, shows changes that occur after that particular version of a resource. Defaults to changes from the beginning of history. When specified for list: - if unset, then the result is returned from remote storage based on quorum-read flag; - if it's 0, then we simply return what we currently have in cache, no guarantee; - if set to non zero, then the result is at least as fresh as given rv.
instance HasOptionalParam ListLeaseForAllNamespaces ResourceVersion where
  applyOptionalParam req (ResourceVersion xs) =
    req `setQuery` toQuery ("resourceVersion", Just xs)

-- | /Optional Param/ "timeoutSeconds" - Timeout for the list/watch call. This limits the duration of the call, regardless of any activity or inactivity.
instance HasOptionalParam ListLeaseForAllNamespaces TimeoutSeconds where
  applyOptionalParam req (TimeoutSeconds xs) =
    req `setQuery` toQuery ("timeoutSeconds", Just xs)

-- | /Optional Param/ "watch" - Watch for changes to the described resources and return them as a stream of add, update, and remove notifications. Specify resourceVersion.
instance HasOptionalParam ListLeaseForAllNamespaces Watch where
  applyOptionalParam req (Watch xs) =
    req `setQuery` toQuery ("watch", Just xs)
-- | @application/json@
instance Produces ListLeaseForAllNamespaces MimeJSON
-- | @application/json;stream=watch@
instance Produces ListLeaseForAllNamespaces MimeJsonstreamwatch
-- | @application/vnd.kubernetes.protobuf@
instance Produces ListLeaseForAllNamespaces MimeVndKubernetesProtobuf
-- | @application/vnd.kubernetes.protobuf;stream=watch@
instance Produces ListLeaseForAllNamespaces MimeVndKubernetesProtobufstreamwatch
-- | @application/yaml@
instance Produces ListLeaseForAllNamespaces MimeYaml


-- *** listNamespacedLease

-- | @GET \/apis\/coordination.k8s.io\/v1\/namespaces\/{namespace}\/leases@
-- 
-- list or watch objects of kind Lease
-- 
-- AuthMethod: 'AuthApiKeyBearerToken'
-- 
listNamespacedLease 
  :: Accept accept -- ^ request accept ('MimeType')
  -> Namespace -- ^ "namespace" -  object name and auth scope, such as for teams and projects
  -> KubernetesRequest ListNamespacedLease MimeNoContent V1LeaseList accept
listNamespacedLease  _ (Namespace namespace) =
  _mkRequest "GET" ["/apis/coordination.k8s.io/v1/namespaces/",toPath namespace,"/leases"]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthApiKeyBearerToken)

data ListNamespacedLease  

-- | /Optional Param/ "pretty" - If 'true', then the output is pretty printed.
instance HasOptionalParam ListNamespacedLease Pretty where
  applyOptionalParam req (Pretty xs) =
    req `setQuery` toQuery ("pretty", Just xs)

-- | /Optional Param/ "allowWatchBookmarks" - allowWatchBookmarks requests watch events with type \"BOOKMARK\". Servers that do not implement bookmarks may ignore this flag and bookmarks are sent at the server's discretion. Clients should not assume bookmarks are returned at any specific interval, nor may they assume the server will send any BOOKMARK event during a session. If this is not a watch, this field is ignored. If the feature gate WatchBookmarks is not enabled in apiserver, this field is ignored.
instance HasOptionalParam ListNamespacedLease AllowWatchBookmarks where
  applyOptionalParam req (AllowWatchBookmarks xs) =
    req `setQuery` toQuery ("allowWatchBookmarks", Just xs)

-- | /Optional Param/ "continue" - The continue option should be set when retrieving more results from the server. Since this value is server defined, clients may only use the continue value from a previous query result with identical query parameters (except for the value of continue) and the server may reject a continue value it does not recognize. If the specified continue value is no longer valid whether due to expiration (generally five to fifteen minutes) or a configuration change on the server, the server will respond with a 410 ResourceExpired error together with a continue token. If the client needs a consistent list, it must restart their list without the continue field. Otherwise, the client may send another list request with the token received with the 410 error, the server will respond with a list starting from the next key, but from the latest snapshot, which is inconsistent from the previous list results - objects that are created, modified, or deleted after the first list request will be included in the response, as long as their keys are after the \"next key\".  This field is not supported when watch is true. Clients may start a watch from the last resourceVersion value returned by the server and not miss any modifications.
instance HasOptionalParam ListNamespacedLease Continue where
  applyOptionalParam req (Continue xs) =
    req `setQuery` toQuery ("continue", Just xs)

-- | /Optional Param/ "fieldSelector" - A selector to restrict the list of returned objects by their fields. Defaults to everything.
instance HasOptionalParam ListNamespacedLease FieldSelector where
  applyOptionalParam req (FieldSelector xs) =
    req `setQuery` toQuery ("fieldSelector", Just xs)

-- | /Optional Param/ "labelSelector" - A selector to restrict the list of returned objects by their labels. Defaults to everything.
instance HasOptionalParam ListNamespacedLease LabelSelector where
  applyOptionalParam req (LabelSelector xs) =
    req `setQuery` toQuery ("labelSelector", Just xs)

-- | /Optional Param/ "limit" - limit is a maximum number of responses to return for a list call. If more items exist, the server will set the `continue` field on the list metadata to a value that can be used with the same initial query to retrieve the next set of results. Setting a limit may return fewer than the requested amount of items (up to zero items) in the event all requested objects are filtered out and clients should only use the presence of the continue field to determine whether more results are available. Servers may choose not to support the limit argument and will return all of the available results. If limit is specified and the continue field is empty, clients may assume that no more results are available. This field is not supported if watch is true.  The server guarantees that the objects returned when using continue will be identical to issuing a single list call without a limit - that is, no objects created, modified, or deleted after the first request is issued will be included in any subsequent continued requests. This is sometimes referred to as a consistent snapshot, and ensures that a client that is using limit to receive smaller chunks of a very large result can ensure they see all possible objects. If objects are updated during a chunked list the version of the object that was present at the time the first list result was calculated is returned.
instance HasOptionalParam ListNamespacedLease Limit where
  applyOptionalParam req (Limit xs) =
    req `setQuery` toQuery ("limit", Just xs)

-- | /Optional Param/ "resourceVersion" - When specified with a watch call, shows changes that occur after that particular version of a resource. Defaults to changes from the beginning of history. When specified for list: - if unset, then the result is returned from remote storage based on quorum-read flag; - if it's 0, then we simply return what we currently have in cache, no guarantee; - if set to non zero, then the result is at least as fresh as given rv.
instance HasOptionalParam ListNamespacedLease ResourceVersion where
  applyOptionalParam req (ResourceVersion xs) =
    req `setQuery` toQuery ("resourceVersion", Just xs)

-- | /Optional Param/ "timeoutSeconds" - Timeout for the list/watch call. This limits the duration of the call, regardless of any activity or inactivity.
instance HasOptionalParam ListNamespacedLease TimeoutSeconds where
  applyOptionalParam req (TimeoutSeconds xs) =
    req `setQuery` toQuery ("timeoutSeconds", Just xs)

-- | /Optional Param/ "watch" - Watch for changes to the described resources and return them as a stream of add, update, and remove notifications. Specify resourceVersion.
instance HasOptionalParam ListNamespacedLease Watch where
  applyOptionalParam req (Watch xs) =
    req `setQuery` toQuery ("watch", Just xs)
-- | @application/json@
instance Produces ListNamespacedLease MimeJSON
-- | @application/json;stream=watch@
instance Produces ListNamespacedLease MimeJsonstreamwatch
-- | @application/vnd.kubernetes.protobuf@
instance Produces ListNamespacedLease MimeVndKubernetesProtobuf
-- | @application/vnd.kubernetes.protobuf;stream=watch@
instance Produces ListNamespacedLease MimeVndKubernetesProtobufstreamwatch
-- | @application/yaml@
instance Produces ListNamespacedLease MimeYaml


-- *** patchNamespacedLease

-- | @PATCH \/apis\/coordination.k8s.io\/v1\/namespaces\/{namespace}\/leases\/{name}@
-- 
-- partially update the specified Lease
-- 
-- AuthMethod: 'AuthApiKeyBearerToken'
-- 
patchNamespacedLease 
  :: (Consumes PatchNamespacedLease contentType, MimeRender contentType Body)
  => ContentType contentType -- ^ request content-type ('MimeType')
  -> Accept accept -- ^ request accept ('MimeType')
  -> Body -- ^ "body"
  -> Name -- ^ "name" -  name of the Lease
  -> Namespace -- ^ "namespace" -  object name and auth scope, such as for teams and projects
  -> KubernetesRequest PatchNamespacedLease contentType V1Lease accept
patchNamespacedLease _  _ body (Name name) (Namespace namespace) =
  _mkRequest "PATCH" ["/apis/coordination.k8s.io/v1/namespaces/",toPath namespace,"/leases/",toPath name]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthApiKeyBearerToken)
    `setBodyParam` body

data PatchNamespacedLease 
instance HasBodyParam PatchNamespacedLease Body 

-- | /Optional Param/ "pretty" - If 'true', then the output is pretty printed.
instance HasOptionalParam PatchNamespacedLease Pretty where
  applyOptionalParam req (Pretty xs) =
    req `setQuery` toQuery ("pretty", Just xs)

-- | /Optional Param/ "dryRun" - When present, indicates that modifications should not be persisted. An invalid or unrecognized dryRun directive will result in an error response and no further processing of the request. Valid values are: - All: all dry run stages will be processed
instance HasOptionalParam PatchNamespacedLease DryRun where
  applyOptionalParam req (DryRun xs) =
    req `setQuery` toQuery ("dryRun", Just xs)

-- | /Optional Param/ "fieldManager" - fieldManager is a name associated with the actor or entity that is making these changes. The value must be less than or 128 characters long, and only contain printable characters, as defined by https://golang.org/pkg/unicode/#IsPrint. This field is required for apply requests (application/apply-patch) but optional for non-apply patch types (JsonPatch, MergePatch, StrategicMergePatch).
instance HasOptionalParam PatchNamespacedLease FieldManager where
  applyOptionalParam req (FieldManager xs) =
    req `setQuery` toQuery ("fieldManager", Just xs)

-- | /Optional Param/ "force" - Force is going to \"force\" Apply requests. It means user will re-acquire conflicting fields owned by other people. Force flag must be unset for non-apply patch requests.
instance HasOptionalParam PatchNamespacedLease Force where
  applyOptionalParam req (Force xs) =
    req `setQuery` toQuery ("force", Just xs)

-- | @application/apply-patch+yaml@
instance Consumes PatchNamespacedLease MimeApplyPatchyaml
-- | @application/json-patch+json@
instance Consumes PatchNamespacedLease MimeJsonPatchjson
-- | @application/merge-patch+json@
instance Consumes PatchNamespacedLease MimeMergePatchjson
-- | @application/strategic-merge-patch+json@
instance Consumes PatchNamespacedLease MimeStrategicMergePatchjson

-- | @application/json@
instance Produces PatchNamespacedLease MimeJSON
-- | @application/vnd.kubernetes.protobuf@
instance Produces PatchNamespacedLease MimeVndKubernetesProtobuf
-- | @application/yaml@
instance Produces PatchNamespacedLease MimeYaml


-- *** readNamespacedLease

-- | @GET \/apis\/coordination.k8s.io\/v1\/namespaces\/{namespace}\/leases\/{name}@
-- 
-- read the specified Lease
-- 
-- AuthMethod: 'AuthApiKeyBearerToken'
-- 
readNamespacedLease 
  :: Accept accept -- ^ request accept ('MimeType')
  -> Name -- ^ "name" -  name of the Lease
  -> Namespace -- ^ "namespace" -  object name and auth scope, such as for teams and projects
  -> KubernetesRequest ReadNamespacedLease MimeNoContent V1Lease accept
readNamespacedLease  _ (Name name) (Namespace namespace) =
  _mkRequest "GET" ["/apis/coordination.k8s.io/v1/namespaces/",toPath namespace,"/leases/",toPath name]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthApiKeyBearerToken)

data ReadNamespacedLease  

-- | /Optional Param/ "pretty" - If 'true', then the output is pretty printed.
instance HasOptionalParam ReadNamespacedLease Pretty where
  applyOptionalParam req (Pretty xs) =
    req `setQuery` toQuery ("pretty", Just xs)

-- | /Optional Param/ "exact" - Should the export be exact.  Exact export maintains cluster-specific fields like 'Namespace'. Deprecated. Planned for removal in 1.18.
instance HasOptionalParam ReadNamespacedLease Exact where
  applyOptionalParam req (Exact xs) =
    req `setQuery` toQuery ("exact", Just xs)

-- | /Optional Param/ "export" - Should this value be exported.  Export strips fields that a user can not specify. Deprecated. Planned for removal in 1.18.
instance HasOptionalParam ReadNamespacedLease Export where
  applyOptionalParam req (Export xs) =
    req `setQuery` toQuery ("export", Just xs)
-- | @application/json@
instance Produces ReadNamespacedLease MimeJSON
-- | @application/vnd.kubernetes.protobuf@
instance Produces ReadNamespacedLease MimeVndKubernetesProtobuf
-- | @application/yaml@
instance Produces ReadNamespacedLease MimeYaml


-- *** replaceNamespacedLease

-- | @PUT \/apis\/coordination.k8s.io\/v1\/namespaces\/{namespace}\/leases\/{name}@
-- 
-- replace the specified Lease
-- 
-- AuthMethod: 'AuthApiKeyBearerToken'
-- 
replaceNamespacedLease 
  :: (Consumes ReplaceNamespacedLease contentType, MimeRender contentType V1Lease)
  => ContentType contentType -- ^ request content-type ('MimeType')
  -> Accept accept -- ^ request accept ('MimeType')
  -> V1Lease -- ^ "body"
  -> Name -- ^ "name" -  name of the Lease
  -> Namespace -- ^ "namespace" -  object name and auth scope, such as for teams and projects
  -> KubernetesRequest ReplaceNamespacedLease contentType V1Lease accept
replaceNamespacedLease _  _ body (Name name) (Namespace namespace) =
  _mkRequest "PUT" ["/apis/coordination.k8s.io/v1/namespaces/",toPath namespace,"/leases/",toPath name]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthApiKeyBearerToken)
    `setBodyParam` body

data ReplaceNamespacedLease 
instance HasBodyParam ReplaceNamespacedLease V1Lease 

-- | /Optional Param/ "pretty" - If 'true', then the output is pretty printed.
instance HasOptionalParam ReplaceNamespacedLease Pretty where
  applyOptionalParam req (Pretty xs) =
    req `setQuery` toQuery ("pretty", Just xs)

-- | /Optional Param/ "dryRun" - When present, indicates that modifications should not be persisted. An invalid or unrecognized dryRun directive will result in an error response and no further processing of the request. Valid values are: - All: all dry run stages will be processed
instance HasOptionalParam ReplaceNamespacedLease DryRun where
  applyOptionalParam req (DryRun xs) =
    req `setQuery` toQuery ("dryRun", Just xs)

-- | /Optional Param/ "fieldManager" - fieldManager is a name associated with the actor or entity that is making these changes. The value must be less than or 128 characters long, and only contain printable characters, as defined by https://golang.org/pkg/unicode/#IsPrint.
instance HasOptionalParam ReplaceNamespacedLease FieldManager where
  applyOptionalParam req (FieldManager xs) =
    req `setQuery` toQuery ("fieldManager", Just xs)
    
-- | @*/*@
instance MimeType mtype => Consumes ReplaceNamespacedLease mtype

-- | @application/json@
instance Produces ReplaceNamespacedLease MimeJSON
-- | @application/vnd.kubernetes.protobuf@
instance Produces ReplaceNamespacedLease MimeVndKubernetesProtobuf
-- | @application/yaml@
instance Produces ReplaceNamespacedLease MimeYaml

