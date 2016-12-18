From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/5] request_key.2: add information regarding default keyring
Date: Sun, 18 Dec 2016 06:40:47 +0000
Message-ID: <CACGkJds2J_kHPrXKyjm71LTcudHx1rtQyYvPVFaGefbAZb5c3Q@mail.gmail.com>
References: <528b203d-ac72-e4a6-8517-e8c5c11055a4@gmail.com>
 <20161121205940.GA16505@obsidian> <6df2c812-c2d6-321c-902f-93b4d3aaa953@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6df2c812-c2d6-321c-902f-93b4d3aaa953-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Howells <dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Sat, Dec 17, 2016 at 12:21 PM, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hello Eugene, (and David)
>
> [David, could you take a look at the FIXMEs below?]
>
> On 11/21/2016 09:59 PM, Eugene Syromyatnikov wrote:
>> ---
>>  man2/request_key.2 | 47 ++++++++++++++++++++++++++++++++++++++++++-----
>>  1 file changed, 42 insertions(+), 5 deletions(-)
>>
>> diff --git a/man2/request_key.2 b/man2/request_key.2
>> index a9d0561..e29ca06 100644
>> --- a/man2/request_key.2
>> +++ b/man2/request_key.2
>> @@ -35,11 +35,6 @@ If the key is found or created,
>>  attaches it to the keyring whose ID is specified in
>>  .I dest_keyring
>>  and returns the key's serial number.
>> -.\" FIXME Is 'keyring' allowed to be 0? Reading the source, it appears =
so.
>> -.\" In this case, by default, the key is assigned to the session keyrin=
g.
>> -.\" But, the KEYCTL_SET_REQKEY_KEYRING also seems to have an influence =
here.
>> -.\" What are the details here?
>> -.\"
>>
>>  .BR request_key ()
>>  first recursively searches for a matching key in all of the keyrings
>> @@ -104,6 +99,48 @@ This specifies the caller's UID-specific keyring
>>  .B KEY_SPEC_USER_SESSION_KEYRING
>>  This specifies the caller's UID-session keyring
>>  .RB ( user-session-keyring (7)).
>> +.PP
>> +When the
>> +.I dest_keyring
>> +is specified to
>> +.BR 0 ,
>> +and no key construction have been performed, then no additional linking=
 is done.
>> +Otherwise, if new key is constructed, it would be linked to the "defaul=
t"
>> +keyring (which can be specified via the
>> +.BR keyctl (2)
>> +command
>> +.BR KEYCTL_SET_REQKEY_KEYRING ).
>> +More specifically, when kernel tries to determine to which keyring the
>> +newly constructed key should be linked, it tries the following options,=
 starting
>> +from the value set via
>> +.BR KEYCTL_SET_REQKEY_KEYRING " " keyctl (2)
>> +command until it finds the first available one:
>> +.IP \(bu 3
>> +.\" 8bbf4976b59fc9fc2861e79cab7beb3f6d647640
>> +Requestor keyring (specified via
>> +.BR KEY_REQKEY_DEFL_REQUESTOR_KEYRING ,
>> +since Linux 2.6.29)
>> +.IP \(bu
>> +Thread-specific keyring (specified via
>> +.BR KEY_REQKEY_DEFL_THREAD_KEYRING )
>> +.IP \(bu
>> +Process-specific keyring (specified via
>> +.BR KEY_REQKEY_DEFL_PROCESS_KEYRING )
>> +.IP \(bu
>> +Session-specific keyring (specified via
>> +.BR KEY_REQKEY_DEFL_SESSION_KEYRING )
>> +.IP \(bu
>> +Session keyring for the process's user ID  (specified via
>> +.BR KEY_REQKEY_DEFL_USER_SESSION_KEYRING ).
>> +This keyring is expected to always exist.
>> +.IP \(bu
>> +UID-specific keyring (specified via
>> +.BR KEY_REQKEY_DEFL_USER_KEYRING ).
>> +This keyring is also expected to always exist.
>> +.PP
>> +Specifying
>> +.B KEY_REQKEY_DEFL_DEFAULT
>> +leads to starting from the beginning of the list.
>>  .\"
>>  .SS Requesting user-space instantiation of a key
>>  If the kernel cannot find a key matching
>
> Thanks. Everything that I tested concurs with your patch, but
> I've done some rewording that makes things a bit clearer, and
> I've added one or two details.
>
> How does the following look:
>
>        The  dest_keyring serial number may be that of a valid keyring for
>        which the caller has write permission, or it may  be  one  of  the
>        following special keyring IDs:
>
>        KEY_SPEC_THREAD_KEYRING
>               This   specifies   the   caller's  thread-specific  keyring
>               (thread-keyring(7)).
>
>        KEY_SPEC_PROCESS_KEYRING
>               This  specifies  the  caller's   process-specific   keyring
>               (process-keyring(7)).
>
>        KEY_SPEC_SESSION_KEYRING
>               This  specifies the caller's session-specific keyring (ses=
=E2=80=90
>               sion-keyring(7)).
>
>        KEY_SPEC_USER_KEYRING
>               This specifies the  caller's  UID-specific  keyring  (user-
>               keyring(7)).
>
>        KEY_SPEC_USER_SESSION_KEYRING
>               This  specifies the caller's UID-session keyring (user-ses=
=E2=80=90
>               sion-keyring(7)).
>
>        When the dest_keyring is specified to 0, and no  key  construction
>        have been performed, then no additional linking is done.
>
>        Otherwise,  if  dest_keyring is 0 and a new key is constructed, th=
e new
>        key will be linked to the "default" keyring.  More precisely, when=
  the
>        kernel  tries  to  determine to which keyring the newly constructe=
d key
>        should be linked, it tries the following keyrings, beginning  with=
  the
>        keyring  set  via  the  keyctl(2) KEYCTL_SET_REQKEY_KEYRING comman=
d and
>        continuing in the order shown below until it finds  the  first  ke=
yring
>        that exists:
>
>        =C2=B7  The   requestor  keyring  (KEY_REQKEY_DEFL_REQUESTOR_KEYRI=
NG,  since
>           Linux 2.6.29).
>
>           =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
>           =E2=94=82FIXME                                                =
=E2=94=82
>           =E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=A4
>           =E2=94=82Actually, is the  preceding  point  correct?   If  I =
=E2=94=82
>           =E2=94=82understand  correctly,  we'll only get here if won't =
=E2=94=82
>           =E2=94=82refer to a keyring. Have I misunderstood?            =
=E2=94=82
>           =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98
(The "if (cred->request_key_auth)" condition at request_key.c:271 is
entered only in case cred->request_key_auth is set, and it is set to
non-zero value (apart from cred copying) only in
keyctl_change_reqkey_auth() at keyctl.c:1017. This function, in turn,
is called with non-zero argument only in keyctl_assume_authority(),
keyctl.c:1408. And this uses result of key_get_instantiation_authkey()
(defined in request_key_auth.c:242), which searches of a key of type
key_type_request_key_auth. Keys of this type are constructed by
request_key_auth_new() at request_key_auth.c:147 (if i understood
correctly), and the only call site for this function is
construct_key() at request_key.c:203. It is then calls
call_sbin_request_key (or other actor of type request_key_actor_t
which can be set in key type=E2=80=94maybe this should be pointed out
somewhere in terms how it is set/configured, but the only place where
it is non-NULL=E2=80=94found by quick git grep=E2=80=94is fs/nfs/nfs4idmap.=
c:
.request_key    =3D nfs_idmap_legacy_upcall, but it's difficult to say
whether it has other uses despite message of commit b5f545c which
initially introduced request_key field and functionality also points
at NFS) with the struct key_construction provided in the furst
argument, where authley field is set to the newly constructed authkey.
In call_sbin_request_key() authkey is linked (at request_key.c:127) to
the newly created (at request_key.c:117) keyring and latter then
passed to call_usermodehelper_keys() at request_key.c:175 as a
session_keyring. In call_usermodehelper_keys() it is passed as
subprocess data, which is then used by provided in the
call_usermodehelper_setup() call at request_key.c:80 umh_keys_init
callback for installing it as a session keyring with a
install_session_keyring_to_cred() call (defined in
process_keys.c:223).

So, this is possible (only?=E2=80=94i haven't seen a possibility to set
requestor keyring from the user space) in case the kernel upcalls
helper process for instantiating a key=E2=80=94this makes request
authorization key being linked to a session keyring. And by calling
keyctl(KEYCTL_ASSUME_AUTHORITY), this process might set
request_key_auth (since it knows appropriate ID as it has target key
ID passed as a second parameter=E2=80=94request_key.c:166). This helper
process could then perform request_key with destringid set to 0 (and
with the default keyring being set to
KEY_REQKEY_DEFL_REQUESTOR_KEYRING or KEY_REQKEY_DEFL_DEFAULT),
effectively meeting all conditions for executing this code.

>        =C2=B7  The thread-specific keyring (KEY_REQKEY_DEFL_THREAD_KEYRIN=
G).
>
>        =C2=B7  The process-specific keyring (KEY_REQKEY_DEFL_PROCESS_KEYR=
ING).
>
>        =C2=B7  The session-specific keyring (KEY_REQKEY_DEFL_SESSION_KEYR=
ING).
>
>        =C2=B7  The    session    keyring    for    the    process's     u=
ser     ID
>           (KEY_REQKEY_DEFL_USER_SESSION_KEYRING).  This keyring is expect=
ed to
>           always exist.
>
>           =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
>           =E2=94=82FIXME                                                =
=E2=94=82
>           =E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=A4
>           =E2=94=82Are there circumstances where  the  session  keyring =
=E2=94=82
>           =E2=94=82does not exist?  What are they?                      =
=E2=94=82
>           =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98
>
>        =C2=B7  The   UID-specific   keyring  (KEY_REQKEY_DEFL_USER_KEYRIN=
G).   This
>           keyring is also expected to always exist.
>
>           =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
>           =E2=94=82FIXME                                                =
=E2=94=82
>           =E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=A4
>           =E2=94=82Are  there  circumstances  where  the   UID-specific =
=E2=94=82
>           =E2=94=82keyring does not exist?  What are they?              =
=E2=94=82
>           =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98
>
>        If    the   keyctl(2)   KEYCTL_SET_REQKEY_KEYRING   command   spec=
ifies
>        KEY_REQKEY_DEFL_DEFAULT (or  no  KEYCTL_SET_REQKEY_KEYRING  comman=
d  is
>        performed),  then  the  kernel  looks  for  a keyring starting fro=
m the
>        beginning of the list.
>
> These changes have been pushed to the public branch:
> http://git.kernel.org/cgit/docs/man-pages/man-pages.git/log/?h=3Ddraft_2_=
keys
>
> Cheers,
>
> Michael
>
>
>
> --
> Michael Kerrisk
> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> Linux/UNIX System Programming Training: http://man7.org/training/



--=20
Eugene Syromyatnikov
mailto:evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
xmpp:esyr@jabber.{ru|org}
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
