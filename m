From: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: open_by_handle_at(2) and name_to_handle_at(2)
Date: Mon, 12 Sep 2011 15:29:13 -0400
Message-ID: <20110912192913.GA15182@infradead.org>
References: <4E6A7B89.7070708@atsec.com>
 <4E6E547F.2000104@atsec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4E6E547F.2000104-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephan Mueller <stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, Sep 12, 2011 at 08:50:39PM +0200, Stephan Mueller wrote:
> as the actual file handle can have a varying size. The variable of
> .I handle_type
> specifies how the file within the filesystem is encoded. This value
> is set to one of the following values:

This has absolutely no business in the man page.  As far as userspace
is concerned this simply is an opaque handle freely chose by the
file system.  The only reason we have an emum for them is to make
it easier to follow them on the wire using tools like wireshark.


The man page should probably also mentioned that these systems calls
are optinal and might not be present on modern kernel in case they
have been disabled during configuration.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
