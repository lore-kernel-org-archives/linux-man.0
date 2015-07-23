From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Draft 3 of bpf(2) man page for review
Date: Thu, 23 Jul 2015 11:58:01 +0200
Message-ID: <55B0BAA9.4020106@gmail.com>
References: <55AFE46F.3090800@gmail.com> <55AFED75.2030208@plumgrid.com> <55AFF8BF.3050204@gmail.com> <55B01535.4080809@plumgrid.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55B01535.4080809-uqk4Ao+rVK5Wk0Htik3J/w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexei Starovoitov <ast-uqk4Ao+rVK5Wk0Htik3J/w@public.gmane.org>, Daniel Borkmann <daniel-FeC+5ew28dpmcu3hnIyYJQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Silvan Jegen <s.jegen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Walter Harms <wharms-fPG8STNUNVg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 07/23/2015 12:12 AM, Alexei Starovoitov wrote:
> On 7/22/15 1:10 PM, Michael Kerrisk (man-pages) wrote:
>>         BPF  maps  are  a generic data structure for storage of diff=
erent
>>         data types.  A  user  process  can  create  multiple  maps  =
(with
>>         key/value-pairs  being  opaque bytes of data) and access the=
m via
>>         file descriptors.  Differnt eBPF programs  can  access  the =
 same
>>         maps  in  parallel.  It's up to the user process and eBPF pr=
ogram
>>         to decide what they store inside maps.
>=20
> typo in 'Different'

=46ixed.

>>     eBPF program types
>>         By picking prog_type, the program author selects a set of  h=
elper
>>         functions that can be called from the eBPF program and the c=
orre=E2=80=90
>>         sponding format of struct bpf_context (which  is  the  data =
 blob
>>         passed  into  the eBPF program as the first argument).  For =
exam=E2=80=90
>>         ple,     programs     loaded     with     a     prog_type   =
   of
>>         BPF_PROG_TYPE_SOCKET_FILTER  may  call  the bpf_map_lookup_e=
lem()
>>         helper, whereas some other program  types  may  not  be  abl=
e  to
>>         employ  this helper.  The set of functions available to eBPF=
 pro=E2=80=90
>>         grams of a given type may increase in the future.
>=20
> overall it's all correct, but today bpf_map_lookup_elem() is allowed
> for all program types. May be change that to:
> "BPF_PROG_TYPE_KPROBE may call the bpf_probe_read() helper"
> since only type_kprobe programs can call it.
> type_sockets/type_sched_* cannot.

Changed, as you suggest.

>>                The bpf_context argument is a pointer to a struct sk_=
buff.
>>                Programs cannot access the fields of sk_buff directly=
=2E
>=20
> Probably drop last sentence and replace 'sk_buff' with '__sk_buff'
> in the first? Or for the first version we can drop both sentences.

I did the former.

> The rest looks great. Thank you much!

Thanks,

Michael



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
