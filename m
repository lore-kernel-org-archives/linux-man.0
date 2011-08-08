From: "J. Bruce Fields" <bfields-uC3wQj2KruNg9hUCZPvPmw@public.gmane.org>
Subject: Re: nfsservctl(2)
Date: Mon, 8 Aug 2011 12:23:28 -0400
Message-ID: <20110808162328.GD904@fieldses.org>
References: <20110808162232.GC904@fieldses.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110808162232.GC904-uC3wQj2KruNg9hUCZPvPmw@public.gmane.org>
Sender: linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>, linux-nfs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The nfsservctl system call has long been superceded by a better
interface, and is finally getting removed in the 3.1 kernel.

I'm not sure what to do with the man page--remove it, or add a note
saying it's gone from recent kernels?  Do you have something you
generally do in such cases?

It's been replaced by a set of files in the nfsd filesystem, which is
documented in nfsd(7).  That man page looks sufficiently up-to-date to
cover the functionality previous provided by nfsservctl.  (Though I only
skimmed it quickly.  It might be worth a more careful review some day.)

--b.

(Argh, sorry, resending with cut-n-pasted addresses de-obfuscated.)
--
To unsubscribe from this list: send the line "unsubscribe linux-nfs" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
