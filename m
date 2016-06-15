From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: charmap.5: clarify keyword syntax
Date: Wed, 15 Jun 2016 10:58:05 +0300
Message-ID: <57610A8D.6080105@redhat.com>
References: <575E5EA5.6050707@redhat.com> <20160614165643.GF4053@vapier.lan>
Reply-To: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160614165643.GF4053-UgUKS2FnFs9+urZeOPWqwQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi,

On 2016-06-14 19:56, Mike Frysinger wrote:
> On 13 Jun 2016 10:20, Marko Myllynen wrote:
>> The patch below updates charmap.5 to match the syntax all the glibc
>> charmap files are using currently.
> 
> hmm, i guess this is confusing.  when i read the man page, i see it as
> the normal syntax of "<required value>" rather than the <> being literal
> characers that you need to type out.  although in that regard, i would
> expect it to look something like:
> 	<character> <byte-sequence> [comment]
> 
> although in the locale(5) page, we rarely use the <foo> syntax.

Yes, in the locale(5) page <foo> is now used only in cases like:

  The characters <space> and <tab> are automatically included.

In the glibc charmap files the <> notation is used with keywords, the
man pages states that comment is optional but would it make thing
clearer if we would use something like:

.TP
<
.I code_set_name
> is followed by the name of the character map.

(Ok, that renders badly but you get the idea.)

Thanks,

-- 
Marko Myllynen
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
