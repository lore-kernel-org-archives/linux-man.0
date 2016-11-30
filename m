From: "Wainer S. Moschetta" <wainersm-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: RFC: man-page for strfrom functions
Date: Wed, 30 Nov 2016 17:22:52 -0200
Message-ID: <e277d505-797f-acaf-2fce-56de92db5030@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi all,

The strfrom class of functions convert a floating-point value into string. It is recently introduced in Glibc (see commit 6962682ffe5e) and will be in version 2.25.

I've prepared a patch to add strfrom.3 in the man-pages but I'd like to discuss a point for the contribution beforehand:

- strfrom* is similar to snprintf() except for the format string. For instance, it doesn't have the length modifier and accept just a subset of conversion specifiers.

That said, I've doubt if wouldn't be better to place strfrom documentation at snprintf man-page (which is actually printf's) rather than on its own page.

What do you advice me?

- Wainer

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
