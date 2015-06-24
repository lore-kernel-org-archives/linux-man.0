From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] rpc.3: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 24 Jun 2015 17:28:38 +0800
Message-ID: <1435138119-30051-3-git-send-email-zenglg.jy@cn.fujitsu.com>
References: <1435138119-30051-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1435138119-30051-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

After research, We think
auth_destroy(), authnone_create(),
authunix_create(), authunix_create_default(),
callrpc(), clnt_broadcast(),
clnt_call(), clnt_destroy(),
clnt_create(), clnt_control(),
clnt_freeres(), clnt_geterr(),
clnt_pcreateerror(), clnt_perrno(),
clnt_perror(), clnt_spcreateerror(),
clnt_sperrno(), clnt_sperror(),
clntraw_create(), clnttcp_create(),
clntudp_create(), clntudp_bufcreate(),
get_myaddress(), pmap_getmaps(),
pmap_getport(), pmap_rmtcall(),
pmap_set(), pmap_unset(),
registerrpc(), svc_destroy(),
svc_freeargs(), svc_getargs(),
svc_getcaller(), svc_getreqset(),
svc_getreq(), svc_register(),
svc_run(), svc_sendreply(),
svc_unregister(), svcerr_auth(),
svcerr_decode(), svcerr_noproc(),
svcerr_noprog(), svcerr_progvers(),
svcerr_systemerr(), svcerr_weakauth(),
svcfd_create(), svcraw_create(),
svctcp_create(), svcudp_bufcreate(),
svcudp_create(), xdr_accepted_reply(),
xdr_authunix_parms(), xdr_callhdr(),
xdr_callmsg(), xdr_opaque_auth(),
xdr_pmap(), xdr_pmaplist(),
xdr_rejected_reply(), xdr_replymsg(),
xprt_register(), xprt_unregister(),
are thread-safe. But, there are not
markings of them in glibc document.

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/rpc.3 | 110 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/man3/rpc.3 b/man3/rpc.3
index 9c6d2b4..20f532e 100644
--- a/man3/rpc.3
+++ b/man3/rpc.3
@@ -1100,6 +1100,116 @@ it should unregister itself with the RPC service package.
 This routine modifies the global variable
 .IR svc_fds .
 Service implementors usually do not need this routine.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw35 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR auth_destroy (),
+.BR authnone_create (),
+.br
+.BR authunix_create (),
+.br
+.BR authunix_create_default (),
+.br
+.BR callrpc (),
+.BR clnt_broadcast (),
+.br
+.BR clnt_call (),
+.BR clnt_destroy (),
+.br
+.BR clnt_create (),
+.BR clnt_control (),
+.br
+.BR clnt_freeres (),
+.BR clnt_geterr (),
+.br
+.BR clnt_pcreateerror (),
+.BR clnt_perrno (),
+.br
+.BR clnt_perror (),
+.br
+.BR clnt_spcreateerror (),
+.br
+.BR clnt_sperrno (),
+.BR clnt_sperror (),
+.br
+.BR clntraw_create (),
+.BR clnttcp_create (),
+.br
+.BR clntudp_create (),
+.br
+.BR clntudp_bufcreate (),
+.br
+.BR get_myaddress (),
+.BR pmap_getmaps (),
+.br
+.BR pmap_getport (),
+.BR pmap_rmtcall (),
+.br
+.BR pmap_set (),
+.BR pmap_unset (),
+.br
+.BR registerrpc (),
+.BR svc_destroy (),
+.br
+.BR svc_freeargs (),
+.BR svc_getargs (),
+.br
+.BR svc_getcaller (),
+.BR svc_getreqset (),
+.br
+.BR svc_getreq (),
+.BR svc_register (),
+.br
+.BR svc_run (),
+.BR svc_sendreply (),
+.br
+.BR svc_unregister (),
+.BR svcerr_auth (),
+.br
+.BR svcerr_decode (),
+.BR svcerr_noproc (),
+.br
+.BR svcerr_noprog (),
+.BR svcerr_progvers (),
+.br
+.BR svcerr_systemerr (),
+.BR svcerr_weakauth (),
+.br
+.BR svcfd_create (),
+.BR svcraw_create (),
+.br
+.BR svctcp_create (),
+.br
+.BR svcudp_bufcreate (),
+.br
+.BR svcudp_create (),
+.BR xdr_accepted_reply (),
+.br
+.BR xdr_authunix_parms (),
+.br
+.BR xdr_callhdr (),
+.br
+.BR xdr_callmsg (),
+.BR xdr_opaque_auth (),
+.br
+.BR xdr_pmap (),
+.BR xdr_pmaplist (),
+.br
+.BR xdr_rejected_reply (),
+.br
+.BR xdr_replymsg (),
+.br
+.BR xprt_register (),
+.BR xprt_unregister ()
+T}	Thread safety	MT-Safe
+.TE
+
 .SH SEE ALSO
 .\" We don't have an rpc_secure.3 page in the set at the moment -- MTK, 19 Sep 05
 .\" .BR rpc_secure (3),
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
