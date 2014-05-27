From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] localedef.1: add new page based on Debian localedef(1)
Date: Tue, 27 May 2014 11:18:05 +0300
Message-ID: <53844A3D.1000600@redhat.com>
References: <53834E2B.1040100@redhat.com> <53835782.10204@gmail.com> <53837379.8030600@redhat.com> <53844885.6010603@gmail.com>
Reply-To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53844885.6010603-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Braakman <richard.braakman-4y2FMlU5MS8onNqTyK5kxQ@public.gmane.org>, Alastair McKinstry <mckinstry-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Lars Wirzenius <liw-X3B1VOXEql0@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi,

On 2014-05-27 11:10, Michael Kerrisk (man-pages) wrote:
> On 05/26/2014 07:01 PM, Marko Myllynen wrote:
>> On 2014-05-26 18:02, Michael Kerrisk (man-pages) wrote:
> 
>> +.SH DESCRIPTION
>> +The
>> +.B localedef
>> +program reads the indicated
>> +.I charmap
>> +and
>> +.I input
>> +files, compiles them to a binary form quickly usable by the
>> +.BR locale (7)
> 
> I changed 
> "locale(7) function sin the C library" 
> to 
> "locale functions in the C library (setlocale(3), localeconv(3), etc.)"
> 
> Okay?

Sure.

Thanks for your help, and thanks to Richard, Alastair, and Lars for the
foundation for this.

Cheers,

-- 
Marko Myllynen
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
