Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793480824;
	b=d1VtZ++ZlHqLaEkfcKyfDgSug39SLsKQ1PnUx1QJxDGDQ7yGWpL4U5JzBXZ2S9qZVBQ+
	 AGWhFysnKFPSdB8EsPF6hqTTMSw/NPjtw21mo28nLuSSCvzgvDbg3OUbej00HtJE0Ih4b
	 tHCrII2BzeA2RfgIVDKEwwSQS6eMTm608oObYmNBfMaZrSqPdbMXca2+8r3KgW1vpEREk
	 ZPc2PaMECJ0+YpDqzmhv3zFr08Y19eXnChmKXkVLKzoeLA/+Q0ModB4MRKX1v7ENuQLyo
	 tXyR9EDS2b7/8GaLLrMzHxzUEcZXoSjEfSf4Sf8UtgPgNRqSB6XQJHAd4GHZllD9loA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793480824;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=P0T7QPPcd0uK8PrIjGMLiDpMhWMx8shiHbP0s0pMa+8=;
	b=TqzHVyZ/LXTqzyL6ExU65qTN+MjNqXpIa7t1M9yNrExs86vObmkZCtEt+izkfQDGO3Mw
	 MD8hn1GLvHDCnCdPCZBysW5s8pNvWjomOGph+6cHWqHT79Mrtpm0A2nHaq0aYaTaZ6gWQ
	 petD/ou+5Ldq0I6v0IQLhI4wW4kER1HjEE8mhhnj6os/q4OCVV69SXTyh0I3x86E7tHIr
	 iWjZ1i7polppBSOYLx5X2g9FN/glXE3WG5E/uYaPz6hm0x60ONM6p5kd9x5f/MlQYAwsd
	 YLKXZMBfgF5+RzZjLB+AxudM3jrDfE3fgK503nPobbo90dVJwdcZMj4KJj8YOQKNeaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xNuBVkDu;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83570606A31A
	for <linux-man@vger.kernel.org>; Sat, 31 Oct 2026 21:07:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83570606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xNuBVkDu
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48c4649b35bso1732373f8f.3
        for <linux-man@vger.kernel.org>; Sat, 31 Oct 2026 14:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793480823; x=1794085623; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P0T7QPPcd0uK8PrIjGMLiDpMhWMx8shiHbP0s0pMa+8=;
        b=xNuBVkDuv5ZwCxdh5VOoohFgfvW2eY7DjB5BATAD3skMiLBj6MvjZNJzmZQ3Y5zh//
         WWjC+BLh/6w1FwAlSqstBrI3mUVpVkXb2Z8onydhAzqeEEijLId4SHb0DrqrWblNpU9W
         PaDazBrnJzlXPF7GWZheY5guMK1YMNq6c2SYkW3TF7lIZrVaArY06SdZ9Q3VEt8UWw2W
         5+WhT8Ay5cEyUPKqBI1O1x9SaeUxjT7Vv+6sNzGM1+BDr6TZcahzKNShUyQGonfCEiMF
         i9YIkRPlHEpwundTmPFF/Jb0FhM1uVvhg1hvN6sZ5iKz0pKtawdkFcVf58UhXnfNA0mC
         x2Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793480823; x=1794085623;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=P0T7QPPcd0uK8PrIjGMLiDpMhWMx8shiHbP0s0pMa+8=;
        b=0zG16MEMHCNWnuGaDhaZ2oI4jkjfvGqd2pmCJK7w3KAm6KiOh27RQaxfu/ivAHZAMA
         5bOAZiCZDtfAC2AGE47F9QwiT03Cs0/lb9BRrytVxFjWXX0SU+c83a5SWuhdtdx1NPpc
         48Fw9DLjFMdbULREXVj4QMDW7XEhQxqfbaYYcI81+wxOwWnevSAHEDuh2r5hS9P8+2gE
         r52gVDIuETtQJ/wZRtKXcoyKNDZivYQqDwAY0oRCWtNkaQQ9pRIzWWdfvMWilt+CpmTr
         +wI6ZJ52bOSkhpJQje8HnHHzWAPwEYhjWibs5LR1wKN55LzjhOU6r9a57U56lQ4TGjit
         nNcg==
X-Gm-Message-State: AFq9FYLRRegzzL5vMtZIwERjub5EmfBkHLMBwB46mSucPckugDQ9QJiV
	CAmnOJ88SVJMlnxj6dM4MwukdeEhZ9oe4Mbelbdvd96wZUndg/2aRrYm
X-Gm-Gg: AYBFou13Vu9Vk5/aawDIk/fYmGMVwmQBA+/61ebmmg/tz9/7AZtGt9PeCkG1nJM1P4g
	jwLb6iOn1KtqPG781Vsp1DZZkmQL8jZWEKvUzcbg/9h27HKitJjXpGfQDZtul4Vi5uwv7WAip0A
	fP3ajrlpgmL7rf9UP3XHRLqPbSuf+LS0pQiTwyaXILRhfqD+KOBO89cJrNL+qKqDt4gAro2jx/2
	TDbwAgEdhX+d7709O6/oY0sJrd7Rx6YYR2TX3eRAlzCZ/AKohWEMeKgoOP++HZ09EOKqEZfN1g9
	UjbPwvJDKP9YD9Xy+iDHi2+mGKQofRAuJrLPltvHRwCa/XPoQT3+zEvfmv84/sVf9omvM20LZIy
	jY7pEgOfi+2Fm+2MsJITrjc2klpTNhRpXqNsFRVhlR8/WUQEvuzBgfqWMUiJTTcVU1F8IOCwGP7
	Yl2HhZXI32TbURPQbxjz6kAfCs+8pefOa8Ni6xV1Ia73p6tiUuNPVhwIQArw8EhWn/uH9i+lOVo
	Zy7ckeRdSbIolB39oTnXjrCDNzpieyDJW4eT0z/oczUiY1AJhLtF+uDCrUgYoBnjz8J2sR1BL/f
	mOS5Lpz0OstISpDKJbK5VXGr0D6c4Yx8Dyg5PvV9o98Ca7zZo8RjgJIFa5SxF9zcbw1uMWBjpMA
	4
X-Received: by 2002:a05:6000:605:b0:487:1ac0:32af with SMTP id ffacd0b85a97d-48e6e50d8d8mr14360318f8f.51.1793480822669;
        Sat, 31 Oct 2026 14:07:02 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8e5f4sm10838294f8f.40.2026.10.31.14.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 14:07:02 -0700 (PDT)
Date: Sat, 31 Oct 2026 22:06:56 +0100
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Casey Schaufler <casey@schaufler-ca.com>,
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>
Subject: Re: [PATCH 4/7] man/man7/unix.7: SCM_SECURITY: Generalize to other
 LSMs, not just SELinux
Message-ID: <20261031.f72558cbbbfe@gnoack.org>
References: <atsufiZwUg3d-cKs@debian>
 <20261023.63aab80a9e86@gnoack.org>
 <atuiuCDEpf7H7I7J@debian>
 <20261026.f6d2e191a08e@gnoack.org>
 <20261027.4df00f962b98@gnoack.org>
 <auEa_2LQFAD023tR@devuan>
 <20261027.421170835581@gnoack.org>
 <auEr3XGMrHXiVZjs@devuan>
 <20261028.e5b1e67d24b5@gnoack.org>
 <auHs_2Ev5gQ55SnV@devuan>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <auHs_2Ev5gQ55SnV@devuan>

Hello!

On Wed, Oct 28, 2026 at 01:45:11PM +0100, Alejandro Colomar wrote:
> > On Tue, Oct 27, 2026 at 11:59:15PM +0100, Alejandro Colomar wrote:
> > > > Date: 2026-10-27 23:30:59+0100
> > > > From: Günther Noack <gnoack3000@gmail.com>
> > > > On Tue, Oct 27, 2026 at 10:46:14PM +0100, Alejandro Colomar wrote:
> > > > > > Date: 2026-10-27 09:54:51+0100
> > > > > > From: Günther Noack <gnoack3000@gmail.com>
> > > > > >
> > > > > > On Mon, Oct 26, 2026 at 11:41:13PM +0100, Günther Noack wrote:
> > > > > > > I'm still leaning towards documenting it as a buffer with
> > > > > > > implementation-defined contents which are provided by a LSM.  How
> > > > > > > these buffer contents are interpreted is depending on the LSM in use
> > > > > > > anyway.
> > > > > > 
> > > > > > To make a more concrete and constructive wording proposal:
> > > > > > 
> > > > > > 
> > > > > > SCM_SECURITY
> > > > > > 
> > > > > >   Receive the security context (the security label) of the peer
> > > > > >   socket, as provided by the active Linux Security Module (LSM).  The
> > > > > >   received ancillary data is a byte buffer.
> > > > > > 
> > > > > >   The exact format of the security context buffer is defined by the
> > > > > >   active major LSM.  For example, SELinux returns a SELinux label as a
> > > > > >   string (including a terminating null byte).
> > > > > 
> > > > > Let's pause the discussion of the specific text for now.
> > > > > 
> > > > > I have questions about the exact format used by each LSM.  For example,
> > > > > you say that SELinux guarantees a string.  Does it count the '\0' as
> > > > > part of the data size?  Or is it guaranteed to exist but not counted?
> > > > > 
> > > > > Same question for the other LSMs.
> > > > 
> > > > Yes, SELinux counts the '\0' as part of the buffer size for the
> > > > SCM_SECURITY security context.
> > > 
> > > Ok.
> > > 
> > > > 
> > > > Examples:
> > > > * If the label is "foo", it'll return {'f', 'o', 'o', '\0'} with payload size 4.
> > > > * If the reader calls recvmsg() but preallocates too little space in
> > > >   the msg_control buffer, this can get truncated though, and then it
> > > >   won't end with '\0':
> > > >   {'e', 'x', 'a', 'm', 'p'} with payload size 5 (truncated)
> > > 
> > > Ouch!  So, no string guarantees here either, actually.
> > 
> > Correct.  Callers have to deal with the possibility of truncation,
> > which strips away the null byte.
> 
> Is this true for every LSM?  Do any LSMs guarantee a string even under
> truncation?

Yes, it is true for every LSM (as discussed below) and none of the
LSMs can guarantee a string under truncation.


> > > > * AppArmor excludes the null byte for SCM_SECURITY as well.
> > > >   Implementation is in apparmor_label_to_secctx(), where it populates
> > > >   the struct lsm_context *cp using:
> > > > 
> > > >     len = aa_label_asxprint(&cp->context...)
> > > > 
> > > >   and then sets
> > > > 
> > > >     cp->len = len;
> > > > 
> > > >   The function aa_label_asxprint() returns the length without trailing
> > > >   null byte, as can be seen in its implementation.
> > > 
> > > How does it behave if there's not enough space?  Does AppArmor guarantee
> > > a string?
> > 
> > The truncation case always strips off the null byte at the end of the
> > buffer.  This is handled **independent of the LSM** in the common
> > net/core/scm.c layer one level above - it *always* kicks in when
> > truncation happens.
> 
> Hmmmm.  I believe that layer should guarantee a null byte when it
> truncates the data.  It should be like strscpy(), which guarantees
> a correct string even on truncation.
> 
> This seems to be another bug.

(Bringing it up below together with the AA/Smack payloads which are
also not null-terminated.)

> > To sum it all up in a table: The only case where the null byte is
> > included in the buffer is in SELinux, when the generic SCM layer does
> > not need to do truncation:
> > 
> >                 normal case                truncation case
> >   --------------------------------------------------------------
> >   SELinux       has trailing null byte     no trailing null byte
> >   AppArmor      no trailing null byte      no trailing null byte
> >   Smack         no trailing null byte      no trailing null byte
> > 
> >   (other LSMs don't have the feature at all)
> 
> Thanks for the table!  This seems to me to be 3 bugs: one in AppArmor,
> the same one in Smack, and one in the upper layer which corrupts the
> string when truncating.  I wonder if we can do better in the truncation
> case, or if it's too late for that.
> 
> Would you mind CCing the maintainers of the upper layer in
> net/core/scm.c?

Adding Eric Dumazet, Paolo Abeni and Willem de Brujin.  (Kuniyuki
Iwashima is already in CC.)

Hello maintainers of NETWORKING [SOCKETS]! :)

We are unsure in this documentation review what
the intended format of payloads is which are returned by SCM_SECURITY:
They have previously been documented as zero-terminated strings (for
the SELinux case), but in the case of truncation and in the case of
the two other supported LSMs, there implementation does not return a
trailing zero byte.

Could you please confirm what the intended interface for SCM_SECURITY
is?  The two variants we have been discussing are:

Variant A:
  The returned payload is a byte buffer whose contents are defined by
  the respective LSM (and which are not necessarily zero-terminated).

  Concrete wording proposal for this variant is in:
  https://lore.kernel.org/all/20261027.4df00f962b98@gnoack.org/

Variant B:
  The returned payload is a string which should be zero-terminated.

  (But in this case, the Smack and Apparmor implementation, as well as
  the generic truncation are arguably not doing that right.)


The documentation commit at the top of this dicussion is documenting
the current implementation, but it becomes lengthy and it feels like
it could be crisper if we could document the original intent:
https://lore.kernel.org/all/20261021212256.27961-5-gnoack3000@gmail.com/

I would appreciate your feedback to un-wedge the review. :)

Thanks!
–Günther
