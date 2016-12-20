From: David Howells <dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/5] request_key.2: add information regarding default keyring
Date: Tue, 20 Dec 2016 09:14:51 +0000
Message-ID: <7354.1482225291@warthog.procyon.org.uk>
References: <f06829ea-1d7c-3f9a-1f4b-e6880aacbdc2@gmail.com> <6df2c812-c2d6-321c-902f-93b4d3aaa953@gmail.com> <528b203d-ac72-e4a6-8517-e8c5c11055a4@gmail.com> <20161121205940.GA16505@obsidian> <15546.1482135577@warthog.procyon.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f06829ea-1d7c-3f9a-1f4b-e6880aacbdc2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-ID: <7353.1482225291.1-S6HVgzuS8uM4Awkfq6JHfwNdhmdF6hFW@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Michael Kerrisk (man-pages) <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Here, we're talking about the situation where request_key(2) is called with
> a destination keyring argument (final argument to the call) that is 0.

Yep.

> Does not KEY_REQKEY_DEFL_REQUESTOR_KEYRING then yield "0" as its value, and
> thus this case is a no-op in the list of keyrings searched?.

No.  construct_key_and_link() calls construct_get_dest_keyring() to get the
destination keyring (which includes handling the defaults) and then calls
construct_key() which passes this default to request_key_auth_new().

However, if there is no authorisation key around,
KEY_REQKEY_DEFL_REQUESTOR_KEYRING defaults to the same as
KEY_REQKEY_DEFL_THREAD_KEYRING.

> (Is there something here that I'm missing to do with chained upcalls?)

For chained upcalls, consider the following sequence:

 (1) A process does request_key().  This selects a destination keyring which
     it will paste into the auth key.

 (2) request_key() upcalls and passes the auth key to /sbin/request-key which
     assumes its authority and exec's an appropriate handler.  The default
     keyring setting is KEY_REQKEY_DEFL_DEFAULT, inherited from init_creds.

 (3) The handler process calls request_key() without specifying a destination
     keyring and without changing the default.  This upcalls and selects the
     destination keyring from (1) and pastes it into the auth key.

 (4) request_key() upcalls ...

> > The uid keyrings don't exist until someone tries to access them - at which
> > point they're both created.  
> 
> Does "access" here mean attempt to "read ow update" the keyring, or are the
> UID keyring created only on the first attempt to "update: them?

It means lookup_user_key() was passed KEY_LOOKUP_CREATE.  So:

	add_key() - destination keyring
	request_key() - destination keyring
	KEYCTL_GET_KEYRING_ID - if create arg is true
	KEYCTL_CLEAR
	KEYCTL_LINK - both args
	KEYCTL_SEARCH - destination keyring
	KEYCTL_CHOWN
	KEYCTL_SETPERM
	KEYCTL_SET_TIMEOUT
	KEYCTL_INSTANTIATE - destination keyring
	KEYCTL_INSTANTIATE_IOV - destination keyring
	KEYCTL_NEGATE - destination keyring
	KEYCTL_REJECT - destination keyring
	KEYCTL_GET_PERSISTENT - destination keyring

will all create a keyring under some circumstances.  Whereas the rest, such as
KEYCTL_GET_SECURITY, KEYCTL_READ and KEYCTL_REVOKE, won't.

David
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
