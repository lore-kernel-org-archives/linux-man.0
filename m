From: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: [PATCH] remap_file_pages.2: Not actually useful on real files.
Date: Thu, 8 May 2014 05:50:32 -0700
Message-ID: <20140508125032.GA24087@infradead.org>
References: <5de30c3a21531919712fc7df213c18b46e521225.1355955125.git.luto@amacapital.net>
 <536B5221.60407@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <536B5221.60407-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Thu, May 08, 2014 at 11:45:05AM +0200, Michael Kerrisk (man-pages) wrote:
> I've applied the above. I then tweaked it a little. Is the following
> okay:
> 
> [[
> Since Linux 2.6.23,
> .\" commit 3ee6dafc677a68e461a7ddafc94a580ebab80735
> .BR remap_file_pages ()
> has no performance advantage over
> .BR mmap (2)
> when used on real files:
> on real files it creates a separate VMA for each range.
> It does, however, continue to provide a performance advantage
> for files on memory-based filesystems.
> ]]

I think "real file" is a very bad term.  What is more real about one
file vs another?  Is NFS less real than XFS, is tmpfs more real than
ramfs?

I'd reword this more like this:

Since Linux 2.6.23, remap_file_pages only creates non-linear mappings
on in-memory file systems like tmpfs, hugetlbfs or ramfs.  File systems
with a backing store provide a less efficient emulation.


I think the whole man page for remap_file_pages is a litt confusing I
have to say, the concept of a VMA is purely kernel internal and doesn't
really have a meaning for applications and thus shouldn't appear in a
man page.


While we're at it:  It seems like we should get rid of the remap_pages
vma operation - it's set by lots of filesystems that can never have
it invoked, and always is set to generic_file_remap_pages anyway.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
