From: Sebastian Huber <sebastian.huber-L1vi/lXTdtsBbLBgBO8hYIQuADTiUCJX@public.gmane.org>
Subject: PTHREAD_CLEANUP_PUSH_DEFER_NP(3)
Date: Thu, 04 Jul 2013 16:38:52 +0200
Message-ID: <51D588FC.6070701@embedded-brains.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello,

I think there is an error in the description

        is equivalent to (but shorter and more efficient than):

            int oldtype;

            pthread_cleanup_push(routine, arg);
            pthread_setcanceltype(PTHREAD_CANCEL_DEFERRED, &oldtype);
            ...
            pthread_setcanceltype(oldtype, NULL);
            pthread_cleanup_pop(execute);

this should be instead

        is equivalent to (but shorter and more efficient than):

            int oldtype;

            pthread_setcanceltype(PTHREAD_CANCEL_DEFERRED, &oldtype);
            pthread_cleanup_push(routine, arg);
            ...
            pthread_cleanup_pop(execute);
            pthread_setcanceltype(oldtype, NULL);

--=20
Sebastian Huber, embedded brains GmbH

Address : Dornierstr. 4, D-82178 Puchheim, Germany
Phone   : +49 89 189 47 41-16
=46ax     : +49 89 189 47 41-09
E-Mail  : sebastian.huber-L1vi/lXTdtsBbLBgBO8hYIQuADTiUCJX@public.gmane.org
PGP     : Public key available on request.

Diese Nachricht ist keine gesch=E4ftliche Mitteilung im Sinne des EHUG.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
