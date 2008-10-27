From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: Review request: pthread_attr_setstack.3
Date: Mon, 27 Oct 2008 10:50:39 -0500
Message-ID: <cfd18e0f0810270850i12543c8en6cda2e63cf76205c@mail.gmail.com>
References: <cfd18e0f0810241431q28cf1167i3df49166479d516c@mail.gmail.com>
	 <775f04010810250501p63b11cbdv4ef4b1c70b6de332@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <775f04010810250501p63b11cbdv4ef4b1c70b6de332-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, josv-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, "brian m. carlson" <sandals-spVehEqlxw627WubY2PhZQivdfXVPZ6z@public.gmane.org>, Bert Wesarg <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Stefan,

>> The
>> .BR pthread_attr_setscope ()
>                               ^^^^^
> This looks like a copy/paste error - it's also present in at least one
> of the other manpages you posted. I guess this should be
> pthread_attr_setstack().

Thanks for spotting that.  I applied the changes below.

Cheers,

Michael

diff --git a/man3/pthread_attr_setstack.3 b/man3/pthread_attr_setstack.3
index 50cedf5..dc084bb 100644
--- a/man3/pthread_attr_setstack.3
+++ b/man3/pthread_attr_setstack.3
@@ -49,7 +49,7 @@ _POSIX_C_SOURCE\ >=\ 200112L || _XOPEN_SOURCE\ >=\ 600
 .ad b
 .SH DESCRIPTION
 The
-.BR pthread_attr_setscope ()
+.BR pthread_attr_setstack ()
 function sets the stack address and stack size attributes of the
 thread attributes object referred to by
 .I attr
diff --git a/man3/pthread_attr_setstacksize.3 b/man3/pthread_attr_setstacksize.3
index f553936..8767c48 100644
--- a/man3/pthread_attr_setstacksize.3
+++ b/man3/pthread_attr_setstacksize.3
@@ -37,7 +37,7 @@ attribute in thread attributes object
 Compile and link with \fI\-pthread\fP.
 .SH DESCRIPTION
 The
-.BR pthread_attr_setscope ()
+.BR pthread_attr_setstacksize ()
 function sets the stack size attribute of the
 thread attributes object referred to by
 .I attr
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
