From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] MAN: Clarify mremap.2 prototype
Date: Fri, 11 Jun 2010 16:34:33 +0200
Message-ID: <AANLkTin1Hdqhrza-rDiRAfZ5q7AquQ8zYOBzyaUc1FC0@mail.gmail.com>
References: <20100603090818.GA4741@basil.fritz.box> <AANLkTim4NYbt66oTsxS7ECTzi63gpli6GuSOBgR2ZlR7@mail.gmail.com>
	<20100610171503.GG19561@basil.fritz.box> <AANLkTiltSNhhRO0wxqLA0nNAPv70LBclMQTVKUXQd5hE@mail.gmail.com>
	<20100611083810.GG6864@basil.fritz.box>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100611083810.GG6864-u0/ZJuX+froe6aEkudXLsA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ak-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Andi,

On Fri, Jun 11, 2010 at 10:38 AM, Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org> wrote:
>> > This change will give less information to the reader than the patch. It doesn't
>> > seem like a improvement to me.
>>
>> It gives less information than your patch, because your patch repeated
>> information that was already in the page.
>
> The correct prototype for the 5 argument option was and is still missing.
> Text is no replacement for a correct prototype.

What I want to avoid is cluttering the page with multiple prototypes.
(If we went that way, then pages like fcntl(2) could get rather
messy.) But, to try to alleviate your concern, I modified the patch
somewhat. Hopefully, this will satisfy you.

Cheers,

Michael

--- a/man2/mremap.2
+++ b/man2/mremap.2
@@ -38,7 +38,7 @@ mremap \- remap a virtual memory address
 .B #include <sys/mman.h>
 .sp
 .BI "void *mremap(void *" old_address ", size_t " old_size ,
-.BI "             size_t " new_size ", int " flags );
+.BI "             size_t " new_size ", int " flags ", ... /* void *"
new_address " */);"
 .fi
 .SH DESCRIPTION
 .BR mremap ()
@@ -54,6 +54,11 @@ aligned.
 virtual memory block.
 \fInew_size\fP is the requested size of the
 virtual memory block after the resize.
+An optional fifth argument,
+.IR new_address ,
+may be provided; see the description of
+.B MREMAP_FIXED
+below.

 In Linux the memory is divided into pages.
 A user process has (one or)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
