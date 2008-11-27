From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [RFC] devpts man page update
Date: Thu, 27 Nov 2008 06:38:39 -0500
Message-ID: <cfd18e0f0811270338o392daf81kdfd46cec51325891@mail.gmail.com>
References: <20081126181732.GA1509@us.ibm.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20081126181732.GA1509-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sukadev Bhattiprolu <sukadev-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: Alan Cox <alan-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>, hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, serue-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org, sukadev-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Suka,

On Wed, Nov 26, 2008 at 1:17 PM, Sukadev Bhattiprolu
<sukadev-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org> wrote:
> Michael,
>
> Following is some text that would need to be added to devpts section of
> mount(8) man page (its not a formal patch, just the text to be added).
> I am looking for logistics and a general review of the text to be added.

The mount(8) page is not part of the man-pages set.  Take a look here:
http://www.kernel.org/doc/man-pages/man_pages_other.html

> The relevant kernel patches are currently in ttydev/linux-next trees.
> I can send the formal man page patch after those patches go into mainline.

Though mount(8) is not on my set, I wonder if there is any text that
should perhaps be added to pts(4) or pty(7).

http://www.kernel.org/doc/man-pages/online/pages/man4/pts.4.html
http://www.kernel.org/doc/man-pages/online/pages/man7/pty.7.html

Take a look at those and let me know.

> Also, is it ok to refer to 'Documentation' directory in the man page  -
> there are several semantics outlined in Documentation/filesystem/devpts.txt
> (http://www.linux.org.uk/~alan/ttydev/pty-multiple-doc), that may be of
> use only to users of containers.

Certainly as far as I'm concerned doing this is okay in the pages in
man-pages -- you just need to say "the kernel source file
Documentation/..."

Cheers,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
