From: Jan Chaloupka <jchaloup-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: For review: mtrace(1) man page
Date: Mon, 04 Aug 2014 07:24:57 +0200
Message-ID: <53DF1929.3050207@redhat.com>
References: <53C8E24E.3040704@redhat.com> <1777637.kUP8sTC8nC@vapier>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1777637.kUP8sTC8nC@vapier>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org, myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, drepper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi, Mike

On 08/02/2014 06:57 PM, Mike Frysinger wrote:
> On Fri 18 Jul 2014 11:01:02 Jan Chaloupka wrote:
>> mtrace(1) command is not documented. All informations come from the script.
>>
>> Feel free to comment or ask any question.
> it doesn't feel right for truly glibc-specific tools to have their man pages
> hosted in the Linux man-pages project, especially when you consider
> functionality/flags/etc... skew across glibc versions trying to be tracked in
> an unrelated git repo.

First thing I do, when I need help, is to look into man page. Why? it is 
fast.

> the GNU standard doesn't say that we can't include them in GNU projects, just
> that they should be secondary to info pages.  so i think things like mtrace(1)
> are better in glibc itself.

I have nothing againts putting it into glibc itself as well.

> how else do people feel in this regard ?
> -mike

Jan
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
