Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793168377;
	b=DA82Imk01ppMb7V1dkOGAY9ZfNYOfX6+5SBNo9I7AV/gc4qRFUUmbQJemuyUo6ClaOAV
	 CaOtytz4D9akMMFubVEHwCY/RprXC9QUbnSNuAPUCGjnGwyqY/hjWiOXtdFkwKZSRqAP/
	 nk0byDcTBnn1pDVW0+KAyvmyd62Uh+v2nqFrMV9x33HuyujWOZ/KPHI5ZSiuieYErFb05
	 TCTI3qf+wK4rBDixbeS1nnnErQPnn+j3EzoK/f9zyMnKhv/m5WZEuaJ8aJPJdHHW8Pj2l
	 nYJQvxZn7khHwzwUJQUSk8mxOHU4kN8SSsuQeho2ZDJAfP49MAYQZHQQsGOg+G7sMxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793168377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=a0OEZxf/miGBD/vJwjmltWmwtPR0z1yxlEC5ZFREIcY=;
	b=SGezmP5hDXbQFZyHGTWtj3zUQxWme5IrzVAyASNZfZ213HxtJlMGZuZNSPD+E06U/j8h
	 7VPZtHofyVVzOYjyt6u/fu+UCUjgGcgDBkt0lq2PI4/NPXK9c3vvpYPkc24GPil4gBHrI
	 fChWoaoGVJUEVjdxz5R6t5y601EmNapUB77cfjI2/Mb3UPoUQ8ov4aPw4lCnaAyN4SlT9
	 NS4J7CMP2NqAdWMc7qdM5fxUg10TkpPOtVh3TOvWLxZwht64Q5orKPsjM1XaE+5mnpX9t
	 XVaG5uhdug5hq78y5ZNaKrRmZzc4RBn2j2aQyj9ZG9pwkb2Vgu3Zvu65nwiKlx9u/xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WT+LkuGZ;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D71606A31A
	for <linux-man@vger.kernel.org>; Wed, 28 Oct 2026 06:19:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8D71606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WT+LkuGZ
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so5142925e9.2
        for <linux-man@vger.kernel.org>; Tue, 27 Oct 2026 23:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793168375; x=1793773175; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a0OEZxf/miGBD/vJwjmltWmwtPR0z1yxlEC5ZFREIcY=;
        b=WT+LkuGZgc1vYqsPaiqbKiaa3IAXc4/TwKt+9KnP8I8k+er0ovwjiH/rzfjbtVx15O
         Rb6+inUzGOJlvDUQIR9S+XnEk4vREjyLwWORlTEu7RTHhafCo3mfGgumntfLibjXNTGz
         emWhsIH5MoCUrYtEZC6e/DhhsZ9asZy/fcf0vwy/y/ufqhGVe3yqBuAPrx2O15EOD4Oy
         sSuQMwjuxhEqF+oVP59mFMrbm9RDQG01ssOx5bHBoBggJ+3D9qVXhnIT7ND3QYvd7iT7
         kcbvjzubHEGM66HyBiPy2gxHGblGvPztXPte1t+xd95NtKv1qUlgI8V/I1+NVUumfLp7
         6fwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793168375; x=1793773175;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a0OEZxf/miGBD/vJwjmltWmwtPR0z1yxlEC5ZFREIcY=;
        b=x6GrrmGlTIrZieXbbI4Gk/WfAdt9gQCGM7KZaWZRevyVJeaJoWxY6diGHODTvAdOTG
         ZcGqfa2qHPnMxkU9r0XIYa0ZYw5EBal9xr/li8s+SEw/en95nGFj/Zp6ADzeGHS+6CkZ
         Ywle6b0wNE/4pU1eclye1+0/Jw0z8MVzBWoo5KqbcfDkTtwClv3HAErGJ+UMEREWvQvF
         gQI6SdyHTtrmt1pTvSu5PLOplHYu67toBRw6D1XdXnima9Tqjp/tGTNfjC87k/ptQduF
         W/D1WNJGFJF1/SWcunXFPPGKbsnPbnB/6xWthqOc1IIjy27xP0TSnFh2qm+h4SKvx18k
         K4uw==
X-Gm-Message-State: AFq9FYIEldgavVdmHPsyfYNNB9ySHLdhF3hlfTLjjKTfdNl/0YPoptDa
	Ixt2ydBxysNKtVzq5+YoIFR7tTtiNs0GtelLYjS49ZnyojNFm+z9b3rN
X-Gm-Gg: AYBFou0LPhkE+dwKaeLMDA+rOPvx4UWwCAa5iW9PD4n+0mSBM1iR6JIFrQJcA240hX4
	erd3dtM5AWqXXHwNC4cUW0/D41DeXGgZaCzEMiDumt9mZOAyBpe66soS+wLqMCoS3tmtb1wXdLI
	Bghn3f/QG3+OpwepH4jHmkPzlX0wbd8LDEuOhyeZDDsibYJLNA2IIh14Txrqa0DzBDiknQSdcK7
	5La793+RxXxp20wmZHfXVrrL7G6xAb4WKCmk1f7YvBhS9+6uV8rrU1IcMSqqMgoRCRTqOrG1vL+
	Qsscsz/sxNGmTDbdtYEniHljq/S2TmX77WaIErV6LYHXZFK4PSDyFYH0Wun4lmauK0YSnKzew5h
	mmy1TBqP8KMXeb4FnvwAGa1SfLKiueJrShMWJlQXs84YszAoREJiHXjpfPJWcM50fxIQMU5rm8g
	dK+leUHGMBzYYOZwj2EHI8kDT6Z0XCUT/xDIniCsLFCKRP9ux+t45eq9IL8AGkvsnNzSX5ZuM4e
	bVB8uw+hyfDVpM1nSL5J16elC3FeUtkK7t65zuCITUXhdUrllStjAnd6a9ZQEsKapQGksAlH46M
	76CtZ5Vf1D0JrpZSA6P4nmJg8Y2aZchcnjXAKYj/p8EeWuEGoky6Rew=
X-Received: by 2002:a05:600c:840e:b0:4a1:813f:2a60 with SMTP id 5b1f17b1804b1-4a965dd3274mr26632635e9.11.1793168374913;
        Tue, 27 Oct 2026 23:19:34 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a92e103d91sm14996185e9.0.2026.10.27.23.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 23:19:34 -0700 (PDT)
Date: Wed, 28 Oct 2026 07:19:28 +0100
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: [PATCH 4/7] man/man7/unix.7: SCM_SECURITY: Generalize to other
 LSMs, not just SELinux
Message-ID: <20261028.e5b1e67d24b5@gnoack.org>
References: <20261021212256.27961-1-gnoack3000@gmail.com>
 <20261021212256.27961-5-gnoack3000@gmail.com>
 <atsufiZwUg3d-cKs@debian>
 <20261023.63aab80a9e86@gnoack.org>
 <atuiuCDEpf7H7I7J@debian>
 <20261026.f6d2e191a08e@gnoack.org>
 <20261027.4df00f962b98@gnoack.org>
 <auEa_2LQFAD023tR@devuan>
 <20261027.421170835581@gnoack.org>
 <auEr3XGMrHXiVZjs@devuan>
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
In-Reply-To: <auEr3XGMrHXiVZjs@devuan>

Hello Alejandro!

On Tue, Oct 27, 2026 at 11:59:15PM +0100, Alejandro Colomar wrote:
> > Date: 2026-10-27 23:30:59+0100
> > From: Günther Noack <gnoack3000@gmail.com>
> > On Tue, Oct 27, 2026 at 10:46:14PM +0100, Alejandro Colomar wrote:
> > > > Date: 2026-10-27 09:54:51+0100
> > > > From: Günther Noack <gnoack3000@gmail.com>
> > > >
> > > > On Mon, Oct 26, 2026 at 11:41:13PM +0100, Günther Noack wrote:
> > > > > I'm still leaning towards documenting it as a buffer with
> > > > > implementation-defined contents which are provided by a LSM.  How
> > > > > these buffer contents are interpreted is depending on the LSM in use
> > > > > anyway.
> > > > 
> > > > To make a more concrete and constructive wording proposal:
> > > > 
> > > > 
> > > > SCM_SECURITY
> > > > 
> > > >   Receive the security context (the security label) of the peer
> > > >   socket, as provided by the active Linux Security Module (LSM).  The
> > > >   received ancillary data is a byte buffer.
> > > > 
> > > >   The exact format of the security context buffer is defined by the
> > > >   active major LSM.  For example, SELinux returns a SELinux label as a
> > > >   string (including a terminating null byte).
> > > 
> > > Let's pause the discussion of the specific text for now.
> > > 
> > > I have questions about the exact format used by each LSM.  For example,
> > > you say that SELinux guarantees a string.  Does it count the '\0' as
> > > part of the data size?  Or is it guaranteed to exist but not counted?
> > > 
> > > Same question for the other LSMs.
> > 
> > Yes, SELinux counts the '\0' as part of the buffer size for the
> > SCM_SECURITY security context.
> 
> Ok.
> 
> > 
> > Examples:
> > * If the label is "foo", it'll return {'f', 'o', 'o', '\0'} with payload size 4.
> > * If the reader calls recvmsg() but preallocates too little space in
> >   the msg_control buffer, this can get truncated though, and then it
> >   won't end with '\0':
> >   {'e', 'x', 'a', 'm', 'p'} with payload size 5 (truncated)
> 
> Ouch!  So, no string guarantees here either, actually.

Correct.  Callers have to deal with the possibility of truncation,
which strips away the null byte.


> > Other LSMs:
> > 
> > * Smack excludes the null byte for SCM_SECURITY (smack_to_secctx())
> >   (but irritatingly it does count the null byte when a label is
> >   returned through SO_PEERSEC (smack_socket_getpeersec_stream()).
> >   Both functions are in security/smack/smack_lsm.c.
> 
> And as we've seen, no string guarantees, IIUC.

Correct.

> > 
> > * AppArmor excludes the null byte for SCM_SECURITY as well.
> >   Implementation is in apparmor_label_to_secctx(), where it populates
> >   the struct lsm_context *cp using:
> > 
> >     len = aa_label_asxprint(&cp->context...)
> > 
> >   and then sets
> > 
> >     cp->len = len;
> > 
> >   The function aa_label_asxprint() returns the length without trailing
> >   null byte, as can be seen in its implementation.
> 
> How does it behave if there's not enough space?  Does AppArmor guarantee
> a string?

The truncation case always strips off the null byte at the end of the
buffer.  This is handled **independent of the LSM** in the common
net/core/scm.c layer one level above - it *always* kicks in when
truncation happens.

To sum it all up in a table: The only case where the null byte is
included in the buffer is in SELinux, when the generic SCM layer does
not need to do truncation:

                normal case                truncation case
  --------------------------------------------------------------
  SELinux       has trailing null byte     no trailing null byte
  AppArmor      no trailing null byte      no trailing null byte
  Smack         no trailing null byte      no trailing null byte

  (other LSMs don't have the feature at all)

–Günther
