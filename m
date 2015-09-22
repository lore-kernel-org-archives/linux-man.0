From: Maria Guseva <m.guseva-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [patch] ld.so.8: outline missed cases of secure run
Date: Tue, 22 Sep 2015 11:58:14 +0300
Message-ID: <"062e01d0f514$d15f9e40$741edac0$@guseva"@samsung.com>
References: <"01f701d0e407$c718f530$554adf90$@guseva"@samsung.com>
 <55F65D25.1080708@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <55F65D25.1080708-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-language: ru
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "'Michael Kerrisk (man-pages)'" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: 'Yury Gribov' <y.gribov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, v.garbuzov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


Hello Michael, Yury

> What do you think of the alternative patch below?
Thank you, the patch you proposed looks much better. 

>>> While at it, could you also mention that /etc/suid-debug enables 
>>> LD_DEBUG for suids?
>>
>> Does it? I can't see that in the glibc source. Am I missing something?

>I was looking at process_envvars (in rtld.c): it resets dl_debug_mask for
AT_SECURE binaries unless /etc/suid-debug exists.

So I think it should mentioned in LD_DEBUG environment variable description,
here:

.B LD_DEBUG
-is ignored for set-user-ID/set-group-ID binaries.
+is ignored in secure-execution mode.
+However, if the file
+.IR /etc/suid\-debug
+exists (the content of the file is irrelevant), then
+.BR LD_DEBUG
+has an effect in secure-execution mode.
.TP


Regards,
Maria

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
