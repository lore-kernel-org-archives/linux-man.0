From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/5] request_key.2: add information regarding default
 keyring
Date: Fri, 25 Nov 2016 23:11:51 +0300
Message-ID: <20161125201151.GA19312@obsidian>
References: <528b203d-ac72-e4a6-8517-e8c5c11055a4@gmail.com>
 <20161121205940.GA16505@obsidian>
 <54aa766c-25de-74ba-fba5-59cd95b2ae91@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54aa766c-25de-74ba-fba5-59cd95b2ae91-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Fri, Nov 25, 2016 at 11:01:17AM +0100, Michael Kerrisk (man-pages) wrote:
> Hi Eugene,
> 
> On 11/21/2016 09:59 PM, Eugene Syromyatnikov wrote:
> > ---
> >  man2/request_key.2 | 47 ++++++++++++++++++++++++++++++++++++++++++-----
> >  1 file changed, 42 insertions(+), 5 deletions(-)
> > 
> > diff --git a/man2/request_key.2 b/man2/request_key.2
> > index a9d0561..e29ca06 100644
> > --- a/man2/request_key.2
> > +++ b/man2/request_key.2
> > @@ -35,11 +35,6 @@ If the key is found or created,
> >  attaches it to the keyring whose ID is specified in
> >  .I dest_keyring
> >  and returns the key's serial number.
> > -.\" FIXME Is 'keyring' allowed to be 0? Reading the source, it appears so.
> > -.\" In this case, by default, the key is assigned to the session keyring.
> > -.\" But, the KEYCTL_SET_REQKEY_KEYRING also seems to have an influence here.
> > -.\" What are the details here?
> > -.\"
> >  
> >  .BR request_key ()
> >  first recursively searches for a matching key in all of the keyrings
> > @@ -104,6 +99,48 @@ This specifies the caller's UID-specific keyring
> >  .B KEY_SPEC_USER_SESSION_KEYRING
> >  This specifies the caller's UID-session keyring
> >  .RB ( user-session-keyring (7)).
> > +.PP
> > +When the
> > +.I dest_keyring
> > +is specified to
> > +.BR 0 ,
> > +and no key construction have been performed, then no additional linking is done.
> > +Otherwise, if new key is constructed, it would be linked to the "default"
> > +keyring (which can be specified via the
> > +.BR keyctl (2)
> > +command
> > +.BR KEYCTL_SET_REQKEY_KEYRING ).
> 
> For the purpose of me reviewing this, could you outline how you verified
> the following details:
> 
> > +More specifically, when kernel tries to determine to which keyring the
> > +newly constructed key should be linked, it tries the following options, starting
> > +from the value set via
> > +.BR KEYCTL_SET_REQKEY_KEYRING " " keyctl (2)
> > +command until it finds the first available one:
> > +.IP \(bu 3
> > +.\" 8bbf4976b59fc9fc2861e79cab7beb3f6d647640
> > +Requestor keyring (specified via
> > +.BR KEY_REQKEY_DEFL_REQUESTOR_KEYRING ,
> > +since Linux 2.6.29)
> > +.IP \(bu
> > +Thread-specific keyring (specified via
> > +.BR KEY_REQKEY_DEFL_THREAD_KEYRING )
> > +.IP \(bu
> > +Process-specific keyring (specified via
> > +.BR KEY_REQKEY_DEFL_PROCESS_KEYRING )
> > +.IP \(bu
> > +Session-specific keyring (specified via
> > +.BR KEY_REQKEY_DEFL_SESSION_KEYRING )
> > +.IP \(bu
> > +Session keyring for the process's user ID  (specified via
> > +.BR KEY_REQKEY_DEFL_USER_SESSION_KEYRING ).
> > +This keyring is expected to always exist.
> > +.IP \(bu
> > +UID-specific keyring (specified via
> > +.BR KEY_REQKEY_DEFL_USER_KEYRING ).
> > +This keyring is also expected to always exist.
> > +.PP
> > +Specifying
> > +.B KEY_REQKEY_DEFL_DEFAULT
> > +leads to starting from the beginning of the list.
> >  .\"
> >  .SS Requesting user-space instantiation of a key
> >  If the kernel cannot find a key matching
> > 
>

Based on linux v4.9-rc6 (9c763584):

 * security/keys/keyctl.c, SYSCALL_DEFINE4(request_key, ...), line 158:
  * Assume that call is performed with with destringid == 0:
  * We skip check on line 196, so dest_ref remains NULL
  * On line 213, request_key_and_link is called with key_ref_to_ptr(dest_ref)
   * key_ref_to_ptr() itself just zeroes lower bit which is used for
     indication that key reference in the possession of the current
     context.
 * security/keys/request_key.c, request_key_and_link, line 508:
  * On line 543, we try to search process keyrings for the key (we
    fill ctx at hte beginning of the function and then pass it to
    search_process_keyrings)
  * If key is found (key_ref is not erroneous), we convert key_ref to
    ptr on line 546 and skip the following block on line 547 since
    dest_keyring is 0.
  * If key is not found and error is not EAGAIN, then
    construct_key_and_link is called on line 566 with dest_keyring ==
    NULL.
 * security/keys/request_key.c, construct_key_and_link, line 430:
  * On line 450, construct_get_dest_keyring is called with dest_keyring
    == NULL.
 * security/keys/request_key.c, construct_get_dest_keyring, line 253:
  * The argument here (which is pointer to pointer to struct key) is
    named _dest_keyring, but on line 257 it is dereferenced to local
    variable dest_keyring (so it stores NULL now).
  * We re going to the "else" branch (starting from line 266) of check
    on line 262
  * Now we are switching against cred->jit_keyring with the behavour
    described in the patch.
 * git grep jit_keyring security/keys reveals that it is assigned inside
   keyctl_set_reqkey_keyring, security/keys/keyctl.c, line 1257.
 * keyctl_set_reqkey_keyring is called from SYSCALL_DEFINE5(keyctl,
   ...), when option passed to keyctl is KEYCTL_SET_REQKEY_KEYRING (line
   1652).
 * Default value for jit_keyring is sort of difficult to find out, since
   it is inherited, but overall it is explicitly set to
   KEY_REQKEY_DEFL_THREAD_KEYRING or copied from zeroed-out structures
   (so it is equal to KEY_REQKEY_DEFL_DEFAULT) which leads to the same
   behaviour in case the process has not been upcalled by request_key
   construction.

> Cheers,
> 
> Michael
> 
> -- 
> Michael Kerrisk
> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
