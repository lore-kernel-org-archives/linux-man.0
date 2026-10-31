Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793482236;
	b=kOM7yGkNL//GRqd8Auhl6lzo0RVdW9n7AO5IE2UL76U68Yqv2XUAwv6OwZrsJnw1wUmm
	 xvRGV8GEE0CY4BnNHCsFWDiCF7BPPJqnB3sthY9y9docL89y2qM0ErJYLE1QLDrIZkWFU
	 r1nVnPdcQzsSXL3lZ3jVEsjfxqUG1Q/iTvvCmd9+hnVeXV0V5kJdcGegvpGJ5dX1uTOb1
	 JfUj2mtSEoXdkxQ9jsmaUbWElp3Qg87fgrhdzXmpeTbJbRsV3eW1bzs61UaVBpYq1h6mN
	 74fq4ypgFGS+bKjIYlYVZiuUO4wgeVAzSQLlVkRUR0Sv2+661GcUMl2Ydudsu5gMpmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793482236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=IDbcusKw0UE65gJOZzw8SCLvtCYyjtNG/CmAMbDijnI=;
	b=JK14lYAW69h0s8e3N+MfASkFpV69g7s/c1D5ZZW6QnHlwb80AoLpKXuRM1OI5tDkMlal
	 LFdn5BH2Vov14Lt0kSuxSSOxcBFEf+tsuZLpSOQifQJDRfP6/rs5Q6b5QmpezJitNNEVm
	 DfpbInDgs0gqLrqmeJFeJnFDC2L29z4NIAkUTqcx+amk+wHErVJK0bSFri/vby46a/XjL
	 81tg/VH6C0e73skd8aEj3LFeYGSLhvygO0CF63eTvAMWBSBDgLXCiipMLT3UrwSZBGGDB
	 8mlXPyVyTAXNCtHor3bKvVMXOX27/M93NpWSw555/IVwm3Ly+DX0vLuZqjrbP24huKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IvzZUv5o;
	arc=none smtp.remote-ip=209.85.215.197
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1B4606A31A
	for <linux-man@vger.kernel.org>; Sat, 31 Oct 2026 21:30:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F1B4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IvzZUv5o
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd67d4bbdffso1425451a12.3
        for <linux-man@vger.kernel.org>; Sat, 31 Oct 2026 14:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793482235; x=1794087035; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IDbcusKw0UE65gJOZzw8SCLvtCYyjtNG/CmAMbDijnI=;
        b=IvzZUv5ojHcup+vZBe6rLDVHd6k7sJW9ny+siZ+3vRE+ujsT0t/ScS8Ptj+E3vf5SR
         JotJs3OvX0fhAoExM5VpALrkKYHN6cAsB/uTUoTTkaXFxQzdutGnNtJf8KvzRkpl1pU0
         DcZSXvzhbiFQIOXhEHzhqgyn4t333J218etRxmsIMlf6VDvGh/UsD24Z04WD5YUEG11i
         VsQwa+pjtaRw0UBdskJ3BFvwQQkgZ2OOgH5SjkWDyvreT2vtQ+YrKlwCyDK86wsODKam
         YSV52LUZgXcPZq/cL6UbiIb+Q/7Mq7lyXZKWLlDw3s9mlmUzH1FjWYAfj5luAxz0CSPv
         uVSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793482235; x=1794087035;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IDbcusKw0UE65gJOZzw8SCLvtCYyjtNG/CmAMbDijnI=;
        b=1apeePfIKdYm9p1oNvJLHpQozuKBCaOKEhJ/b4BOCIl8yXN3w3fTaeiKfg1vqrYENF
         QI9zmaArKIqAqitfBTVWpeGMvrsMW8YlWAWdqvIzECZ+Tw8x1gnid59uNEkxXYQTzyQd
         GaC/ogls759chhvc0Z0Bq2a07efZ7EPxMQadxqOtyTXX72WgJ6UjF5D+Dbhm4v9RDefO
         ita99ErWngNvgGqerWGEyPodpR3KUhEAQ59591lSnUhQJLebW2ddYT+KghCjVCwyRIs8
         PKOI2ePQPoMkl8Ps7Q6Wp5gc4lOZLUZj4uj7TNyCoryk4Kx9adhKZ6G0vpdsPhvoKGjU
         gyvQ==
X-Forwarded-Encrypted: i=1; AKwUvBxuxCeZfeyNJPi0GPXbrkQi/m20mP3aaA7aUMhLsZ+fmNCcLbqli82fBjA+EPZk2V/iTRD4d8t/3yU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJTeG0eaGP5RF77qzlNNcMWxTFWTWQ79WaPeqITCLe0kXG5cbh9
	cbcn+uSQ/NIBM6v+GpaOFLqjX0HWa3soZfd6yL0Oa0oI+T4RWRe0InEwIrAJsfdCN7Hdl4SYWkg
	0got9xA==
X-Received: from plbiy13.prod.google.com ([2002:a17:903:130d:b0:2e9:7bc5:bec5])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1aef:b0:2e9:658f:c33d
 with SMTP id d9443c01a7336-2eb36405a95mr59157785ad.4.1793482234734; Sat, 31
 Oct 2026 14:30:34 -0700 (PDT)
Date: Sat, 31 Oct 2026 21:30:34 +0000
In-Reply-To: <20261031.f72558cbbbfe@gnoack.org>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261023.63aab80a9e86@gnoack.org> <atuiuCDEpf7H7I7J@debian>
 <20261026.f6d2e191a08e@gnoack.org> <20261027.4df00f962b98@gnoack.org>
 <auEa_2LQFAD023tR@devuan> <20261027.421170835581@gnoack.org>
 <auEr3XGMrHXiVZjs@devuan> <20261028.e5b1e67d24b5@gnoack.org>
 <auHs_2Ev5gQ55SnV@devuan> <20261031.f72558cbbbfe@gnoack.org>
Message-ID: <auZcwYWv0NeiIR8d@google.com>
Subject: Re: [PATCH 4/7] man/man7/unix.7: SCM_SECURITY: Generalize to other
 LSMs, not just SELinux
From: Kuniyuki Iwashima <kuniyu@google.com>
To: "=?utf-8?Q?G=C3=BCnther?= Noack" <gnoack3000@gmail.com>
Cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org, 
	Michael Kerrisk <mtk.manpages@gmail.com>, Casey Schaufler <casey@schaufler-ca.com>, 
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 31 Oct 2026 22:06:56 +0100, G=C3=BCnther Noack wrote:
> Hello!
>=20
> On Wed, Oct 28, 2026 at 01:45:11PM +0100, Alejandro Colomar wrote:
> > > On Tue, Oct 27, 2026 at 11:59:15PM +0100, Alejandro Colomar wrote:
> > > > > Date: 2026-10-27 23:30:59+0100
> > > > > From: G=C3=BCnther Noack <gnoack3000@gmail.com>
> > > > > On Tue, Oct 27, 2026 at 10:46:14PM +0100, Alejandro Colomar wrote=
:
> > > > > > > Date: 2026-10-27 09:54:51+0100
> > > > > > > From: G=C3=BCnther Noack <gnoack3000@gmail.com>
> > > > > > >
> > > > > > > On Mon, Oct 26, 2026 at 11:41:13PM +0100, G=C3=BCnther Noack =
wrote:
> > > > > > > > I'm still leaning towards documenting it as a buffer with
> > > > > > > > implementation-defined contents which are provided by a LSM=
.  How
> > > > > > > > these buffer contents are interpreted is depending on the L=
SM in use
> > > > > > > > anyway.
> > > > > > >=20
> > > > > > > To make a more concrete and constructive wording proposal:
> > > > > > >=20
> > > > > > >=20
> > > > > > > SCM_SECURITY
> > > > > > >=20
> > > > > > >   Receive the security context (the security label) of the pe=
er
> > > > > > >   socket, as provided by the active Linux Security Module (LS=
M).  The
> > > > > > >   received ancillary data is a byte buffer.
> > > > > > >=20
> > > > > > >   The exact format of the security context buffer is defined =
by the
> > > > > > >   active major LSM.  For example, SELinux returns a SELinux l=
abel as a
> > > > > > >   string (including a terminating null byte).
> > > > > >=20
> > > > > > Let's pause the discussion of the specific text for now.
> > > > > >=20
> > > > > > I have questions about the exact format used by each LSM.  For =
example,
> > > > > > you say that SELinux guarantees a string.  Does it count the '\=
0' as
> > > > > > part of the data size?  Or is it guaranteed to exist but not co=
unted?
> > > > > >=20
> > > > > > Same question for the other LSMs.
> > > > >=20
> > > > > Yes, SELinux counts the '\0' as part of the buffer size for the
> > > > > SCM_SECURITY security context.
> > > >=20
> > > > Ok.
> > > >=20
> > > > >=20
> > > > > Examples:
> > > > > * If the label is "foo", it'll return {'f', 'o', 'o', '\0'} with =
payload size 4.
> > > > > * If the reader calls recvmsg() but preallocates too little space=
 in
> > > > >   the msg_control buffer, this can get truncated though, and then=
 it
> > > > >   won't end with '\0':
> > > > >   {'e', 'x', 'a', 'm', 'p'} with payload size 5 (truncated)
> > > >=20
> > > > Ouch!  So, no string guarantees here either, actually.
> > >=20
> > > Correct.  Callers have to deal with the possibility of truncation,
> > > which strips away the null byte.
> >=20
> > Is this true for every LSM?  Do any LSMs guarantee a string even under
> > truncation?
>=20
> Yes, it is true for every LSM (as discussed below) and none of the
> LSMs can guarantee a string under truncation.
>=20
>=20
> > > > > * AppArmor excludes the null byte for SCM_SECURITY as well.
> > > > >   Implementation is in apparmor_label_to_secctx(), where it popul=
ates
> > > > >   the struct lsm_context *cp using:
> > > > >=20
> > > > >     len =3D aa_label_asxprint(&cp->context...)
> > > > >=20
> > > > >   and then sets
> > > > >=20
> > > > >     cp->len =3D len;
> > > > >=20
> > > > >   The function aa_label_asxprint() returns the length without tra=
iling
> > > > >   null byte, as can be seen in its implementation.
> > > >=20
> > > > How does it behave if there's not enough space?  Does AppArmor guar=
antee
> > > > a string?
> > >=20
> > > The truncation case always strips off the null byte at the end of the
> > > buffer.  This is handled **independent of the LSM** in the common
> > > net/core/scm.c layer one level above - it *always* kicks in when
> > > truncation happens.
> >=20
> > Hmmmm.  I believe that layer should guarantee a null byte when it
> > truncates the data.  It should be like strscpy(), which guarantees
> > a correct string even on truncation.
> >=20
> > This seems to be another bug.
>=20
> (Bringing it up below together with the AA/Smack payloads which are
> also not null-terminated.)
>=20
> > > To sum it all up in a table: The only case where the null byte is
> > > included in the buffer is in SELinux, when the generic SCM layer does
> > > not need to do truncation:
> > >=20
> > >                 normal case                truncation case
> > >   --------------------------------------------------------------
> > >   SELinux       has trailing null byte     no trailing null byte
> > >   AppArmor      no trailing null byte      no trailing null byte
> > >   Smack         no trailing null byte      no trailing null byte
> > >=20
> > >   (other LSMs don't have the feature at all)
> >=20
> > Thanks for the table!  This seems to me to be 3 bugs: one in AppArmor,
> > the same one in Smack, and one in the upper layer which corrupts the
> > string when truncating.  I wonder if we can do better in the truncation
> > case, or if it's too late for that.
> >=20
> > Would you mind CCing the maintainers of the upper layer in
> > net/core/scm.c?
>=20
> Adding Eric Dumazet, Paolo Abeni and Willem de Brujin.  (Kuniyuki
> Iwashima is already in CC.)
>=20
> Hello maintainers of NETWORKING [SOCKETS]! :)
>=20
> We are unsure in this documentation review what
> the intended format of payloads is which are returned by SCM_SECURITY:
> They have previously been documented as zero-terminated strings (for
> the SELinux case), but in the case of truncation and in the case of
> the two other supported LSMs, there implementation does not return a
> trailing zero byte.
>=20
> Could you please confirm what the intended interface for SCM_SECURITY
> is?  The two variants we have been discussing are:
>=20
> Variant A:
>   The returned payload is a byte buffer whose contents are defined by
>   the respective LSM (and which are not necessarily zero-terminated).

+1, basically each scm data is binary.

I think it's just man page was not updated for other LSMs.


>=20
>   Concrete wording proposal for this variant is in:
>   https://lore.kernel.org/all/20261027.4df00f962b98@gnoack.org/
>=20
> Variant B:
>   The returned payload is a string which should be zero-terminated.
>=20
>   (But in this case, the Smack and Apparmor implementation, as well as
>   the generic truncation are arguably not doing that right.)
>=20
>=20
> The documentation commit at the top of this dicussion is documenting
> the current implementation, but it becomes lengthy and it feels like
> it could be crisper if we could document the original intent:
> https://lore.kernel.org/all/20261021212256.27961-5-gnoack3000@gmail.com/
>=20
> I would appreciate your feedback to un-wedge the review. :)
>=20
> Thanks!
> =E2=80=93G=C3=BCnther
