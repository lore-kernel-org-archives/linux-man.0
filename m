From: "Frank Filz" <ffilzlnx-mn4gwa5WIIQysxA8WJXlww@public.gmane.org>
Subject: RE: [Nfs-ganesha-devel] name_to_handle_at() and persistent	filesystem IDs
Date: Mon, 17 Mar 2014 10:01:03 -0700
Message-ID: <009901cf4202$7c310970$74931c50$@mindspring.com>
References: <CAHO5Pa0Y8r1DxHTc0YN-4geoLJ3JYwHT99EcuaGL6k++ek+aEQ@mail.gmail.com> <8761netc3z.fsf@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8761netc3z.fsf-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Content-Language: en-us
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "'Aneesh Kumar K.V'" <aneesh.kumar-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, 'Michael Kerrisk' <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: 'Andreas Dilger' <adilger-m1MBpc4rdrD3fQ9qLvQP4Q@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 'Miklos Szeredi' <miklos-sUDqSbJrdHQHWmgEVkV9KA@public.gmane.org>, 'NeilBrown' <neilb-l3A5Bk7waGM@public.gmane.org>, 'Linux Kernel' <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, 'Christoph Hellwig' <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, 'Linux-Fsdevel' <linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, 'Ganesha NFS List' <nfs-ganesha-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Id: linux-man@vger.kernel.org

> Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
> 
> > Hello Aneesh,
> >
> > I'm currently working on a man page for name_to_handle_at() and
> > open_by_handle_at(), and I have a question relating to a point that
> > probably needs to be covered in the man page.
> >
> > Back in July 2010, in this thread:
> > http://thread.gmane.org/gmane.linux.file-systems/41782/focus=43131
> > you said:
> >
> > [[
> > mount id should not be looked at as a persistent identifier. It should
> > be used to derive a persistent identifier from /proc/self/mountinfo.
> > The persistent identifier could be the combination of device
> > properties, file system properties or the uuid which is going to be an
> > optional tag in /proc/self/mountinfo.
> > ]]
> >
> > In the man page, I'd like to briefly describe how one derives such a
> > persistent ID from mountinfo. AFAICS, the optional UUID tag in
> > /proc/self/mountinfo has not come to pass. So, what then is the
> > recommended practice for deriving the persistent ID?
> >
> 
> Anything that work for the application. mount_id will indicate which mount
it
> is ie. from /proc/self/mountinfo
> 
> 30 20 8:1 / /boot rw,relatime - ext4 /dev/sda1 rw,data=ordered
> 
> The value 30 helps us to figure out that we are looking at device
/dev/sda1.
> With that we can derive the uuid using libblkid.  I am not sure we
concluded
> anything really about how to identify an nfs mount. May be we can do that
> based on server and mount point details ?.But from the syscall point, what
> we return is mount_id, which gives a hint regarding which mount point we
> are talking about in /proc/self/mountinfo. From that information
applications
> can use any method that work for them to derivce an unique identifier.
> 
> I know that NFS ganesha use these syscall. May we can check with them
> what worked for them ? (Added to CC:)

Ganesha ignores the mount id. It's not really clear how it would be used
(would it help detect file system junctions?) since it isn't required on
open_by_handle_at, it's just a return param from name_to_handle_at.

Frank

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
