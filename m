From: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Subject: Re: fs(5) man page is out of date
Date: Wed, 19 May 2010 21:39:41 +0200
Message-ID: <20100519193941.GK1951@machine.or.cz>
References: <4BF2BAD0.5070100@myLetters.US>
 <20100518185651.GQ16800@machine.or.cz>
 <4BF43CAB.7090907@myLetters.US>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4BF43CAB.7090907-yboC7gn3QBoJzESkhhYsnQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeff B <JeffBatHome-yboC7gn3QBoJzESkhhYsnQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, May 19, 2010 at 03:31:55PM -0400, Jeff B wrote:
> 
> >On 05/18/2010 02:56 PM, Petr Baudis wrote:
> >
> >Hi!
> >
> >On Tue, May 18, 2010 at 12:05:36PM -0400, Jeff B wrote:
> >>Just FYI the fs(5) man page is woefully out of date.  The version on your
> >>website at http://www.kernel.org/doc/man-pages/online/pages/man5/fs.5.html,
> >>dated 2007-12-14, does not mention EXT4 and NTFS, among other things.
> >   Patches are welcome.
> >
> >   Kind regards,
> >				Petr "Pasky" Baudis
> 
> OK, you want a patch, you get a patch.   This is against the latest
> version, man-pages-3.24, of the filesystems.5 man page.  I added
> references to ext4 and ntfs by condensing information I took from
> the Wikipedia pages for those file systems.
> 
> I hope it is acceptable that I attached the patch in diff -u format;
> pasting it into this eMail was converting tabs into spaces.
> 
> > cksum  filesystems.5.2010-05-19.new.patch.u
> 55916840 1656 filesystems.5.2010-05-19.new.patch.u

Thanks! I hope mtk will be able to apply it - one thing that is
essential is that you sign off your patch, confirming that you are the
copyright holder and release your changes under the appropriate licence;
sending a

	Signed-off-by: Jeff FullName <JeffBatHome-yboC7gn3QBoJzESkhhYsnQ@public.gmane.org>

line will do.

(It would be also nice to get a short subject + commit text in the mail,
but mtk or me can also supply one in case you don't.)

> --- filesystems.5.man-pages-3.24.ori	2010-02-25 23:46:53.000000000 -0500
> +++ filesystems.5.2010-05-19.new	2010-05-19 15:08:55.653199451 -0400
> @@ -22,12 +22,14 @@
>  .\"
>  .\" 2007-12-14 mtk Added Reiserfs, XFS, JFS.
>  .\"
> -.TH FILESYSTEMS 5 2007-12-14 "Linux" "Linux Programmer's Manual"
> +.\" 2010-05-19 Jeff Barry, Added ext4 and ntfs.
> +.\"
> +.TH FILESYSTEMS 5 2010-05-19 "Linux" "Linux Programmer's Manual"
>  .nh
>  .SH NAME

FYI, we have stopped adding change entries in the file headers.

-- 
				Petr "Pasky" Baudis
When I feel like exercising, I just lie down until the feeling
goes away.  -- xed_over
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
