From: Miklos Szeredi <miklos-sUDqSbJrdHQHWmgEVkV9KA@public.gmane.org>
Subject: Re: Documenting RENAME_WHITEOUT
Date: Fri, 6 Mar 2015 17:11:45 +0100
Message-ID: <20150306161145.GA13649@tucsk.suse.de>
References: <CAKgNAkiog0S5kHYNb_4+d2ZXcA-nPw-cBsuNG03AyEPt3K34nw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkiog0S5kHYNb_4+d2ZXcA-nPw-cBsuNG03AyEPt3K34nw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Thu, Jan 29, 2015 at 11:01:08AM +0100, Michael Kerrisk (man-pages) wrote:
> Hi Miklos,
> 
> I just noticed that your RENAME_WHITEOUT flag went into Linux 3.18:
> commit 0d7a855526dd672e114aff2ac22b60fc6f155b08
> commit 787fb6bc9682ec7c05fb5d9561b57100fbc1cc41
> 
> Would you be willing to write some text for the rename(2)/renameat2(2)
> man page that described this flag. In that text it would be great to
> have an explanation of what a whiteout is and why they are useful.

Hi Michael,

Sorry for the delay...

  RENAME_WHITEOUT is a special operation, that only makes sense for
  overlay/union type filesystem implementations.  Currently it is used
  internally by the overlay filesystem.

  Specifying RENAME_WHITEOUT will create a "whiteout" object at the source of
  the rename at the same time as performing the rename.  The whole operation is
  still atomic, so if the rename succeeds then the whiteout will also have been
  created.

  A "whiteout" is an object that has special meaning in union/overlay type file
  system constructs, in these constructs multiple layers exists and only the top
  one is ever modified.  A whiteout on an upper layer will effectively hide the
  matching file on the lower layer, making it appear if the file didn't exist.

  When a file that exists on the lower layer is renamed, the file is first
  copied up (if not already on the upper layer) and then renamed on the upper,
  read-write layer.  At the same time the source file needs to be "whiteouted".
  The whole operation needs to be done atomically.

  When not part of a union/overlay the whiteout appears as a char device with
  0,0 device number.  RENAME_WHITEOUT needs the same privileges as creating a
  device node (CAP_MKNOD) and will fail with EPERM error if that capability is
  missing.

  If RENAME_WHITEOUT is specified together wuth RENAME_EXCHANGE, then the rename
  with fail with EINVAL error.

Thanks,
Miklos
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
