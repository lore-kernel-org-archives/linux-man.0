From: NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>
Subject: [patch[ epoll_ctl.2, epoll.7: document EPOLLWAKEUP
Date: Sun, 6 Jul 2014 19:03:51 +1000
Message-ID: <20140706190351.423e9a93@notabene.brown>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
 boundary="Sig_/RCY.fDghHqeEpcc2WT1bbmk"; protocol="application/pgp-signature"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arve =?UTF-8?B?SGrDuG5uZXbDpWc=?= <arve-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

--Sig_/RCY.fDghHqeEpcc2WT1bbmk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable



Signed-off-by: NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>
--

I noticed that this was missing so had a go at writing something.

Is there / Should there be a section 7 man page describing suspend and
autosuspend and wakelocks etc??

Comments (of course) welcome.

NeilBrown


diff --git a/man2/epoll_ctl.2 b/man2/epoll_ctl.2
index 1fbe74eeea4e..6388f19195f1 100644
--- a/man2/epoll_ctl.2
+++ b/man2/epoll_ctl.2
@@ -154,6 +154,26 @@ The user must call
 with
 .B EPOLL_CTL_MOD
 to rearm the file descriptor with a new event mask.
+.TP
+.BR EPOLLWAKEUP " (since Linux 3.5)"
+If
+.B EPOLLONESHOT
+and
+.B EPOLLET
+are clear and the process has the
+.B CAP_BLOCK_SUSPEND
+.BR capability (7),
+ensure that the system does not enter "suspend" or
+"hibernate" while this event is pending or being processed.
+The event is considered as being "processed" from when it returned by
+a call to
+.BR epoll_wait (2)
+until the next call to
+.BR epoll_wait (2)
+on the same
+.BR epoll (7)
+file descriptor.
+.\" commit 4d7e30d98939a0340022ccd49325a3d70f7e0238
 .SH RETURN VALUE
 When successful,
 .BR epoll_ctl ()
diff --git a/man7/epoll.7 b/man7/epoll.7
index a372d9727978..31b1a8c8c9ba 100644
--- a/man7/epoll.7
+++ b/man7/epoll.7
@@ -173,6 +173,35 @@ it is the caller's responsibility to rearm the file
descriptor using .BR epoll_ctl (2)
 with
 .BR EPOLL_CTL_MOD .
+.SS Interaction with autosleep
+If the system is in
+.B autosleep
+mode via
+.I /sys/power/autosleep
+and an event happens which wakes the device from sleep, the device
+driver will only keep the device awake until that event is queued.  To
+keep the device awake until the event has been processed it is
+necessary to use
+.B epoll
+and the
+.B EPOLLWAKEUP
+flag.
+
+When this flag is set in the
+.B events
+field for a
+.I struct epoll_event
+then system will be kept awake from the moment the event is queued,
+through the
+.IR epoll_wait (2)
+call which returns the event until the subsequent
+.IR epoll_wait (2)
+call.  If the event should keep the system awake beyond that time,
+the a separate
+.I wake_lock
+should be taken before the second
+.IR epoll_wait (2)
+call.
 .SS /proc interfaces
 The following interfaces can be used to limit the amount of
 kernel memory consumed by epoll:

--Sig_/RCY.fDghHqeEpcc2WT1bbmk
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIVAwUBU7kQ9znsnt1WYoG5AQL/+A/9FhTyA95nVTAlknwSy2AseiCrYtMFo0Hy
rV6/BqZzKai20gnBcYYR9jWIaPZAN2rTZN/47ovY+kFaFDNzCjC6AEzNqxrRj6fp
Yvnx66hVJTPJp7s7qa9/NOQcDxScDqPY8wPvi2PnWzq6kOF7MzAVJfQTSuNBSR3w
h12S5S3qWT6Yk618PrHCCpVBQxaJ0eXTIM6D2y/KdktVwCs7dfQwDF5oDXRpYIFL
a4VLiUClSqfl11nw/mrchPDQ/KGqaSK5DHmLRequqpiWxI2fctjgH1BGkSy1MogG
+oTG9NMrjUtXgpDuPr8xJLvdstsxRMhJx3h18yYdJhlvqz3/nPUGKCvVc/Ah2KlY
sXAIHFNypQlY5gArha+a3PKYUG9UJSEUG0Mct9//057PY2sexudkmV4y6hy6F1yQ
N0qVOrOBQBwK8PVAS8gOia5X+vHZabsDgCF18jNnFsZ/B+j03r7YZ/IREMGlu40U
X2LY/3hyE2Agso96orbKxmXCmuXx4FwqnVrDEtSUnSaGvCDidMU9hcapu0kxiPQ5
xPs876ksqqxdeFKiVkqNCM/C2dgfhZze8ZAcGrXyCtRkaiDzJWo/DkWa1lD6IjB4
id+HZsylBPgBmOEU8Uy7qD6vAjGkxEovhOvFChep04ogfwxDCf7g96TzHAaP4MLW
yBE7Pa/xDOo=
=89f3
-----END PGP SIGNATURE-----

--Sig_/RCY.fDghHqeEpcc2WT1bbmk--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
