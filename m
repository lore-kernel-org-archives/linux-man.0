Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.185.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793118782;
	b=MOwLSGAJ6T5xgkgNjyy9ErqoV6CAjk/js99egsg4AU2Xgo/Kxm44qa8jhpyTFIc3qRuL
	 Riq5G3J3TcCVf43vY47qn4pG2qSl7aleeRBdjqLGlqBrvUuH5zxtAY/kZqcYIAqjHJx2E
	 Nk5h08Wx3zMxPJK2mgsF3Ag35M2uSFfVyYCWmKZfSqjen2ai4SZuTLIEFWNb1nY44fDgN
	 YbYucdIESqzv7zpnEOYJJsM+/3jBSrzSKA5abHv64fYPX04H9Q/dj7h/VVlmx4/ZkykXb
	 /PDfE2N6qsAoTnySwZZIlENfmgLu3wg61CQ1PYvmBJrSaGJOa9MXG2+d6Hq6nvpGquw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793118782;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=hjwGrnCs/j8Eyn4IpkDT6YZPK172kmw4rQWb+S3NaOg=;
	b=qfkYG4EQhd6p2I0NaKqaxr+7vP2a7ta6zYGbNP9pfc2khvs2kMNRepfmE97qSA+c9IMc
	 RCqB/D34g1tRqBDMJOzdwI1R2F7/fIDw1H4o522qntMqFrq7fmkEnyG5D2gup+4P4Xynp
	 q7NCqJ8n1bH5ViG/P/bRvlRb0CBMkBma2F0XuXzMej3TulBnjTCqsBkTL2O7Ie1RvLFr3
	 TrmS1vaR6ZgROK521X3pig7vmG521bXGenEoSrnQ3bxtIl/0XyH4GgF+bwKG9Gfu2tj3I
	 ae/TYDRE2BPD/4JBIneSWIqarQQdwbJNE5O5U5vySWo6twIerbSJauDHEaRhs7HxF5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=schaufler-ca.com;
	spf=pass smtp.mailfrom=schaufler-ca.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=CUl44xx5;
	arc=none smtp.remote-ip=66.163.185.153
Received: from sonic305-27.consmr.mail.ne1.yahoo.com (sonic305-27.consmr.mail.ne1.yahoo.com [66.163.185.153])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE36606A31A
	for <linux-man@vger.kernel.org>; Tue, 27 Oct 2026 16:33:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BE36606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=schaufler-ca.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=schaufler-ca.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=CUl44xx5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1793118780; bh=hjwGrnCs/j8Eyn4IpkDT6YZPK172kmw4rQWb+S3NaOg=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=CUl44xx5whV4g63NoU5ddmpeQzlMjE3tiGTYVuB+pXJOEsi2a5UB4yNrb/2yCVDnAQ1okfzX35zBi3Lg0yI7CjvhgmBltD3oF3jiOGnOXpaBWNBEoq/2UnqMSgWZOeWAEUP2+uqgpZHomWTUTDCvUCqYW0mKcC3YVy3dPPik75CQ3Se6DXEsCzCgq/l3S8omQuWPJaYOfO9x6EBaG7JRpsr8vc1F6unxzyU+Lq575eEVAhejSape+Q3NXC9tbRySAHRgTJt4SLn44t198leT1RlOPO1d8wLWbb6R5xl/iktO7xg2Pk8L2jOjnJN5dwT6li15DwHmxFGTQLe+BWiLXg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1793118780; bh=JL8dwcnO316kk+bjLg/U91bAWAVGxy6zIE9MCGwDuLB=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=n8O/viI3AwL9L1mFZqZg2KNV1ISbM86ZLWk2BdRr4sQwO0EQC4bVOmmDjfCqI3wQ5fQK2x90/Twi/AMeqZRyHqIM5wLFnNNxJPdG9jjGPSEj9AQy0Xx5gOp/pzpMo6/zjG/IvifRgR6xHcQ2ILOXkNHlXFcphvResnk+lWYlj8fjmtvpBArcfQLUUE29+14QhBKGXtRnt6LLrYHHPhcbbcJlmQN/Bix5sPAvIDgbQW4zgqXUfhwQFixV6XqT9ZKoU16vXG2LQwMaeU75XZjjhK6/mMGkS1MxvKJxnWRmCkR7AJx3zgm0OcRD4dyOJcGBeBn2DYI1dx5ISp51Kp5Ndg==
X-YMail-OSG: E6cyF.cVM1m3dsEBuzgQLk5dpI_EwVlJmjRpNnPxRN2JUUqLD1hBtaBzWVqDsG2
 RmQ4QIM8y44_vg8Fye7Rwayl.WzBp1pwVr0sA1E9yBgWk3ZnoJqLkBeUnTgHZBgx7a2HhBpGVuAU
 x2JzpLraWuZd8EaNqJp.DnzCC2pQqVfBlv9BY.VGVkwe2.xloo5UxS5ipyAYDVBJnpY4wZdh_p8K
 Th_7tjdz6qfqrLuK6T2Pc37Py1QGUFHp8o85DchnbDZsDvassG9dhn7eLtsECH_gGQPbcNvfpyNN
 F6sjLYQpeNdT.Bv0hz4mwAC1kP1HsA_.w98c_d0ezBvee2DtpK4Nk_F5XRQAkJtEqHtwUqUKC0q9
 rw0.wyOgJgU5fMSAepN394rOmtLjUZlpVdCsIRAblg9_2UZRi7m9qTMBrxk1S6BUYVXeRRGGNmcC
 W5DojkCPxG5y1UBoUEwAPyGuF9TKG771nu79gdulQUrGtWZd_FCAaXonPStJ5h4s73oU6T2EmTbH
 pbfWF.fRHNHYuUavhhqTDEiH5ra8j_kXkmjTsCSJ9C.bT8_TmrSh.ee4MC_GE3I6wPopiN40Uzfz
 GA6C9jTKQEaKf02T9byLto7eJaOb.NVC8lbVCWx.VMSNPO5dl1tAkDd7PNqDNTVLsBQ4rQeIifBn
 hs8E9g9Bm1PM0WSU.UiRQm1d6Rx4BoqWG__ReZpKgLs3B1LZmuPRQepK42irqowbdvqjUAOMCVdj
 QcUwLoQtzJ1j3UbhaPUexT_JY6VU4YgPy3vZ1hAFrz7z59BU._lv4tMYmao0AtHV1pxFTrn1KsQx
 AX30VZLqH2ZLpMujyRqVl3401A3_ZsjJAm.ey2t398VZmLNkOW1HHqig_ZhShE8i43wSRGbApzO8
 jWhfuT7kQCVrbZ2uxtDQ6qQUx4INGn4uZe_2toBtYAGvvRZevgushETCuf3HyRw9H_ioEnOcKbz4
 5_dWR6Yn_ajOiXRf.BngtmjQX909uEOfoXtZh5s4JyL.oKlpUl.D8voR3KySDp6urFTnrbOaEett
 qsD3l9rmdEydJTIGz1Y9D.Oa18LY.3IA29nZ0q8KiiWQyURnvKRuvGjTS7r16X_52Bb_vhz5q68g
 2JHLMN0rpZ8fPMr3o6aP2C5DGC2DTY9yLmqHNGdGTRr8htjkPmepzs1JlklcADIaHyaeJlBKRiq_
 fxnlU7I6zNCNV5cBpf.d_BzfHLivlMT8ZaLgjtFd_J8qicUE4JGnF0xKZkJRmMChw131X8X9fexI
 r7nPmSpRZ4ya1UVhdUxJmp.tDM2_iuJV3SY8RHzxIumD8taU3XvyD80.vyBWZctqQsCd9UCiJ0oh
 I6QNTUPMd.treN.FEE8UyEM3G0GLGJSgTlVJBWFotlz3oc.B6OwhGGz0JDT53Jx3SzSPsqnm0yly
 6G.cCpOKa2oNu0ZrncvdXXAl3TO5s4bJkeGxIN8fz5MDEIzJYZwFNgOvaCQGAYSHJ2r6kAcwKFWT
 XoBDusKCMbGYKdXBA3m0WvSJJnZPMSBZnQ.FHPSnZtG_yQDsYa0RMBLsSvGf.FSsZwa_UNCxUNQG
 0qKl9YrxA_BWr3c53uogTYEs.ifhJ4H0B9wNcLnFH_nic_i6Ynnbtjfv0UzoDKcDy5Zcdi6aSE1E
 PbM3OjM96QW96otgqzEO6NdkRiq86.dKMMjs8RNhAedOHIVaBhdHPi9SzgAJhY6E_DtobQGrYPmi
 RwR2i0Vb1xa50ZLyRff2boDbglWMBi8ZTdPWWo1aK3tFeoMG.ufqNAA6qIn6Q_ue6nWKmVcm_9R7
 QUZOsdW0XaKjh_5ir7qf.gUbSDOsNOdULvEWyc76Jix66CqLYdH0JHk4qs35dQB3tqZJZL8jrhHO
 Fq5wcEGIUGUkS4vrWY6eeVNA2GkPuHZYKqqMr2q8hDFUfLa7a57VmGkLdWwRB3J1eq.b5ojhFaDP
 ZBnyOB2T3vTJEwcK.jyqsc93ZzOdpNgXWgvbtwmFJF.x0T_kq4cJ0MbJ6qVf_ATVScw620V8YPUO
 2fIs94qY5IJxzUw0p4hkTxxd9v0yWZNDDv99AoRin_OT1IJ8aVQeTYPZd.uwOK6PNq0APHAdDK1U
 WiJUf4rQmXSXPXrXpH9MjIavAHr3EN6Sgr_WC64ybiWE1RwTHL.TXPx9fJ4BRliQxD5fKatps75w
 xiUXgNWkqIaIYP10oGLPReqtrNyyKpyRWaAxIhs9ONoFutX2PyyQ304TdqdLng9ATIEqGbpExvyp
 OXcKBmzoo_HrgfZDXjzQwJ5tqO7d9TE39DB1HffN.Bmv1bhj.EoGUZbCqm8umPPjiuf2_qsRYrwn
 RXdB4
X-Sonic-MF: <casey@schaufler-ca.com>
X-Sonic-ID: 4643b7b8-a35e-4c59-8a74-e558c91dce3b
Received: from sonic.gate.mail.ne1.yahoo.com by sonic305.consmr.mail.ne1.yahoo.com with HTTP; Tue, 27 Oct 2026 16:33:00 +0000
Received: by hermes--production-gq1-fd7994565-sqngh (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 827dade09716877826810e3628222c37;
          Tue, 27 Oct 2026 16:32:59 +0000 (UTC)
Message-ID: <1bd4e8f9-28c5-4db8-bec6-35cd62643fda@schaufler-ca.com>
Date: Tue, 27 Oct 2026 09:32:57 -0700
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] man/man7/unix.7: SCM_SECURITY: Generalize to other
 LSMs, not just SELinux
To: =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>,
 Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>,
 Kuniyuki Iwashima <kuniyu@google.com>,
 Casey Schaufler <casey@schaufler-ca.com>
References: <20261021212256.27961-1-gnoack3000@gmail.com>
 <20261021212256.27961-5-gnoack3000@gmail.com> <atsufiZwUg3d-cKs@debian>
 <20261023.63aab80a9e86@gnoack.org> <atuiuCDEpf7H7I7J@debian>
 <20261026.f6d2e191a08e@gnoack.org>
Content-Language: en-US
From: Casey Schaufler <casey@schaufler-ca.com>
In-Reply-To: <20261026.f6d2e191a08e@gnoack.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.26740 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

On 10/26/2026 3:41 PM, Günther Noack wrote:
> Hello Alejandro, Casey!
>
> On Fri, Oct 23, 2026 at 08:13:22PM +0200, Alejandro Colomar wrote:
>>> Date: 2026-10-23 19:57:16+0200
>>> From: Günther Noack <gnoack3000@gmail.com>
>>> On Fri, Oct 23, 2026 at 11:57:41AM +0200, Alejandro Colomar wrote:
>>>>> Date: 2026-10-21 23:22:53+0200
>>>>> From: Günther Noack <gnoack3000@gmail.com>
>>>>>
>>>>> Reword the description of SCM_SECURITY to not be specific to SELinux.
>>>>>
>>>>> The security context is populated in scm_passec() in linux.git
>>>>> net/core/scm.c, through the security_secid_to_secctx() LSM hook, which
>>>>> is currently implemented by SELinux, Smack and AppArmor.
>>>>>
>>>>> Also clarify the properties of the returned string:
>>>>>
>>>>> * There is no NAME_MAX limit on the length; SELinux contexts can be
>>>>>   longer than that.  If the control buffer is too small, put_cmsg()
>>>>>   truncates the data and sets MSG_CTRUNC.
>>>>>
>>>>> * Whether the string is null-terminated also depends on the LSM:
>>>>>   SELinux includes the null byte in the length, but smack_to_secctx()
>>>>>   in security/smack/smack_lsm.c uses strlen() and doesn't.
>>>> ...
>>> Ah, I can see that this is confusing; let me reformulate that without
>>> mentioning this strlen() implementation detail.  Smack returns a
>>> buffer with a given size *without* including the null byte, roughly
>>> like this (simplified):
>>>
>>>   int len = strlen(skp->smk_known);
>>>   /* populate */
>>>   cp->context = skp->smk_known;
>>>   cp->len = len;    <-- does not span the null byte
>>>
>>> Reformulating to:
>>>
>>>   ...but smack_to_secctx() in security/smack/smack_lsm.c sends a
>>>   security context that does not end in a null byte.
>>>
>>>>> Fixes: ffad6a017f91 (2018-07-28; "unix.7: Document SCM_SECURITY ancillary data")
>>>>> Cc: Michael Kerrisk <mtk.manpages@gmail.com>
>>>>> Cc: Kuniyuki Iwashima <kuniyu@google.com>
>>>>> Assisted-by: LLM
>>>>> Signed-off-by: Günther Noack <gnoack3000@gmail.com>
>>>>> ---
>>>>>
>>>>> Notes:
>>>>>     This feature is also available in other LSMs.  Unfortunately, they
>>>>>     implemented it inconsistently and that complicates the description of
>>>>>     how string boundaries are handled.  Linux does indeed neither
>>>>>     guarantee that this terminates with a NUL byte, nor that NAME_MAX is
>>>>>     large enough to hold it.
>>>> ...
>>>>
>>>>>     
>>>>>     This is the verbose variant, but I am open for suggestions regarding
>>>>>     what level of detail is appropriate here.
>>>>>
>>>>>  man/man7/unix.7 | 25 +++++++++++++++++++------
>>>>>  1 file changed, 19 insertions(+), 6 deletions(-)
>>>>>
>>>>> diff --git a/man/man7/unix.7 b/man/man7/unix.7
>>>>> index ded82768322b..4abd216d19c7 100644
>>>>> --- a/man/man7/unix.7
>>>>> +++ b/man/man7/unix.7
>>>>> @@ -317,7 +317,7 @@ and returned as the result of
>>>>>  is an integer boolean flag.
>>>>>  .TP
>>>>>  .B SO_PASSSEC
>>>>> -Enables receiving of the SELinux security label of the peer socket
>>>>> +Enables receiving of the security label of the peer socket
>>>>>  in an ancillary message of type
>>>>>  .B SCM_SECURITY
>>>>>  (see below).
>>>>> @@ -544,13 +544,26 @@ message, the
>>>>>  option must be enabled on the socket.
>>>>>  .TP
>>>>>  .B SCM_SECURITY
>>>>> -Receive the SELinux security context (the security label)
>>>>> -of the peer socket.
>>>>> -The received ancillary data is a null-terminated string containing
>>>>> +Receive the security context (the security label)
>>>>> +of the peer socket,
>>>>> +as provided by the active Linux Security Module (LSM),
>>>>> +such as SELinux or Smack.
>>>>> +The received ancillary data is a string containing
>>>>>  the security context.
>>>>> -The receiver should allocate at least
>>>>> +Whether the string includes a terminating null byte
>>>>> +depends on the LSM;
>>>> This seems to contradict the commit message.  The commit message says
>>>> that the string is terminated, but that the reported length might or
>>>> might not be off-by-one (i.e., not count or count the '\0').
>>>>
>>>> This text, however, is saying that in some cases there might not be
>>>> a '\0' at all.
>>> The TL;DR is that the byte after the returned buffer's declared length
>>> can't be trusted to be 0 - it is undefined and can be clobbered.
>> Huh!  This is to me a bug.  Would you mind reporting them this as a bug
>> and CCing me?  I'd rather get this fixed in the kernel than documented
>> as broken.
>>
>> Especially, if they use strlen(3) internally, this sounds very much like
>> a kernel bug, but even if not, it is clearly a kernel bug.
>>
>> In any case, if we were to document this bug, we should not use the term
>> string, because anything not containing a '\0' is not a string, by
>> definition.
> Casey, would you be able to confirm whether this constitutes a Smack
> bug or is intentional?

Inclusion of a null byte for C string interfaces has been a topic of
debate since about 1980. At the time this code was written my understanding
was that the data SCM_SECURITY returned could not be assumed to be a
C string. Hence, the size of the data, not the size of a string. The
null byte isn't considered a part of the string, as reported by strlen().

So, the existing behavior is intentional, but I'm willing to have it
considered a bug if (as of today) everyone thinks the data should include
a null byte.

> The TL;DR is that we came across the function smack_to_secctx() in
> smack_lsm.c, which passes a Smack label string in a buffer without a
> terminating null byte.  This is inconsistent with what SELinux and
> AppArmor do.
>
> Before we start explaining so many corner cases in the man pages, I
> wanted to check -- is this something that Smack should fix, by
> including the zero byte?
>
> I tried to double check the Smack userspace utilities but couldn't
> find any use of SCM_SECURITY there.  (Is the feature unused?)

The Smack userspace utilities (github.com://smackteam/smack.git)
represent a limited Smack system implementation. SCM_SECURITY is
used in at least a couple of important embedded and enterprise
implementations.

>>> I have not read the full kernel implementation now, but it can already
>>> be seen in userspace that that adjacent byte can belong to a different
>>> data structue:
>>>
>>>
>>> ## How control messages are represented
>>>
>>> The security context is returned to user space as a cmsghdr structure,
>>> as described in cmsg(3), where it is returned as a buffer of length
>>> cmsg_len:
>>>
>>> struct cmsghdr {
>>> 	size_t cmsg_len;  /* data byte count including header */
>>>         /* some other fields */
>>>
>>> 	/* followed by
>>>            unsigned char cmsg_data[]; */
>>> };
>>>
>>> Reading beyond the declared cmsg_len is undefined, and callers don't
>>> get any guarantees about the byte following the csmg_data[] buffer.
>>>
>>>
>>> ## Iterating from userspace through multiple control messages
>>>
>>> Iterating through the cmsgs is done with the API described in cmsg(3),
>>> CMSG_NXTHDR().  This is implemented as an inlined function in
>>> /usr/include/bits/socket.h.  The function does a bunch of validation
>>> logic and then ends in this rather simple advancement logic:
>>>
>>>   __cmsg = (struct cmsghdr *) ((unsigned char *) __cmsg
>>>                                + CMSG_ALIGN (__cmsg->cmsg_len));
>>>   return __cmsg;
>>>
>>> So, the cmsgs with their cmsg_data[] buffers are next to each other in
>>> memory.  They are aligned, but that still means that the byte after
>>> cmsg_data[] might be part of the next cmsg header or beyond the list
>>> of control messages.
>>>
>>> ---
>>>
>>>
>>> The more I think about this, the more unsure I am that this is even
>>> worth documenting.  In the end, anyone reading and interpreting this
>>> data probably needs to read the corresponding LSM anyway, and trailing
>>> null bytes are probably the least of their worries...?
>> Not only that it's worth documenting, but this might be a vulnerability.
>>> Maybe it would be better to just say something like "The format of the
>>> security context is determined by the LSM responsible for it".  WDYT?
>> I'm unwilling to accept a nonstring as a valid format, unless very good
>> reasons are stated.  And if those reasons are stated as "that ship
>> sailed long ago", the way to document this might very well be BUGS.
> Point taken and agreed that it would be better to call it a "buffer"
> rather than a "string" when it does not have the null terminator.
>
> It does seem that this is used also outside of UNIX Domain Sockets:
> IP_PASSSEC(2const) says:
>
>   The security context returned in the SCM_SECURITY ancillary message
>   is of the same format as the one described in SO_PEERSEC(2const).
>
> And looking this format up in SO_PEERSEC(2const), we find:
>
>   The security context string may include a terminating null character
>   in the returned length, but is not guaranteed to do so: a security
>   context "foo" might be represented as either {'f','o','o'} of length
>   3 or {'f','o','o','\0'} of length 4, which are considered to be
>   interchangeable.  The string is printable, does not contain non-
>   terminating null characters, and is in an unspecified encoding (in
>   particular, it is not guaranteed to be ASCII or UTF-8).
>
> So it seems that these "buffer" (not "string") semantics exist there
> as well.  Maybe it is intentional then that it is treated as a buffer
> rather than a string?

I'm easy. If there is a strong desire to make SCM_SECURITY a string
Smack can be changed easily enough. 

>
>
> I'm still leaning towards documenting it as a buffer with
> implementation-defined contents which are provided by a LSM.  How
> these buffer contents are interpreted is depending on the LSM in use
> anyway.
>
> –Günther
