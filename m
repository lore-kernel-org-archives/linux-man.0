From: =?UTF-8?B?RGF2aWQgUHLDqXZvdA==?= <davidp-whniv8GeeGkdnm+yROfE0A@public.gmane.org>
Subject: [patch] aio.7: Some minor typos (Was: Missing word in aio.7)
Date: Thu, 07 Oct 2010 11:43:56 -0400
Message-ID: <4CADEABC.1040005@altern.org>
References: <AANLkTi=TgkncPeFgP8WTKnHn96Qm6xYK4mdLzumY6Vie@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTi=TgkncPeFgP8WTKnHn96Qm6xYK4mdLzumY6Vie-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

Please find inline a patch including Denis' proposal and two others
spotted during translation, against current aio(7) manual page.


diff --git a/man7/aio.7 b/man7/aio.7
index e1d6d2b..5a0f734 100644
- --- a/man7/aio.7
+++ b/man7/aio.7
@@ -119,11 +119,11 @@ This is the size of the buffer pointed to by
 .I aio_reqprio
 This field specifies a value that is subtracted
 from the calling thread's real-time priority in order to
- -determine the priority for execution of this I/O request.
+determine the priority for execution of this I/O request (see
 .BR pthread_setschedparam (3)).
 The specified value must be between 0 and the value returned by
 .IR sysconf(_SC_AIO_PRIO_DELTA_MAX) .
- -This field is ignored file synchronization operations.
+This field is ignored during file synchronization operations.
 .TP
 .I aio_sigevent
 This field is a structure that specifies how the caller is
@@ -448,7 +448,7 @@ main(int argc, char *argv[])
 .BR io_setup (2),
 .BR io_cancel (2),
 .BR io_destroy (2),
- -.BR io_getevents (2)),
+.BR io_getevents (2),
 .BR aio_cancel (3),
 .BR aio_error (3),
 .BR aio_init (3),


Regards

David
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkyt6rsACgkQ18/WetbTC/op/QCfeVh+YZBzATMWFT+IuMpxLIfh
cpwAoI8YdhmQGszmVYipdT4U5aEUJvmb
=e8Tu
-----END PGP SIGNATURE-----
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
