From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: RFC: man-page for strfrom functions
Date: Thu, 1 Dec 2016 18:15:34 +0100
Message-ID: <ac388dba-b7e4-b33e-7c43-eda88a8e4ac5@gmail.com>
References: <e277d505-797f-acaf-2fce-56de92db5030@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <e277d505-797f-acaf-2fce-56de92db5030-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Wainer S. Moschetta" <wainersm-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Wainer,

On 11/30/2016 08:22 PM, Wainer S. Moschetta wrote:
> Hi all,
> 
> The strfrom class of functions convert a floating-point value into
> string. It is recently introduced in Glibc (see commit 6962682ffe5e)
> and will be in version 2.25.
> 
> I've prepared a patch to add strfrom.3 in the man-pages but I'd like
> to discuss a point for the contribution beforehand:
> 
> - strfrom* is similar to snprintf() except for the format string. For
> instance, it doesn't have the length modifier and accept just a
> subset of conversion specifiers.
> 
> That said, I've doubt if wouldn't be better to place strfrom
> documentation at snprintf man-page (which is actually printf's)
> rather than on its own page.

Thanks. It would be great to get this documentation!

My estimation is that these functions would be better on their 
own page, rather than in printf(3). The strfrom*() functions 
provide only a subset of what snprintf(), and I think embedding
the description of strfrom*() in printf() means they'd be a bit
lost in among all the rest of the text.

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
