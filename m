From: David Howells <dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Migration of some *.7 keyutils man pages from keyutils to man-pages
Date: Tue, 13 Dec 2016 10:45:38 +0000
Message-ID: <24383.1481625938@warthog.procyon.org.uk>
References: <da3e1e69-bc26-fb2a-ce1f-980e77fc4652@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <da3e1e69-bc26-fb2a-ce1f-980e77fc4652-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-ID: <24382.1481625938.1-S6HVgzuS8uM4Awkfq6JHfwNdhmdF6hFW@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, keyrings-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Michael Kerrisk (man-pages) <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> As we discussed face to face, it makes some sense to migrate various 
> of the section 7 keyutils man pages to the man-pages project, since
> they document kernel-user-space interfaces.
> 
> Thus, I have just pulled the current copies of the following pages
> into man-pages:
> 
> keyrings.7
> persistent-keyring.7
> process-keyring.7
> session-keyring.7
> thread-keyring.7
> user-keyring.7
> user-session-keyring.7
> 
> Could you please delete these from the keyutils package.
> 
> Note that I have NOT taken the keyutils.7 page, since that's an
> overview page about the keyutils package and other bits and pieces.

Do you want to give me a patch for this so that the commit has your details on
it?

David
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
