Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C4E43F084
	for <linux-man@vger.kernel.org>; Sat, 18 Jul 2026 18:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784398563; cv=none; b=DWRNUCgwhicZ59/w438jEBdDwRVRl51qDxkySg7S3GF9bj0ttOfADX0FYAxrgg630hh+3A1JXWqEqmsSxAeM37mRASwe1bf2EEDuKTX41s3CM16q3n02WGwI+C2fZ5YgyIN0LQoVQc1fCdFUfM2evQzmCxM51pf/w5evKxBq2O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784398563; c=relaxed/simple;
	bh=TtOdh4o6TLato3R8UHNIW57DqofA/iWuLgWxn6j4f2I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P8zTBBRuXTlJC3y1bgZesSvfbHk+5xCTu5ETM424AdiY8KaswQZs3oKBEquIIhYBucZys8QDZyQDbc6V8xHy5Q30cWe9/njMVebEwfwZmz+JxjvybZM8INiY1GC19TtJI0XpKT7K7S8iapd7jCgeAumDgMy0zyIcgEX+dfNV724=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GpbAhnFp; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GpbAhnFp"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-698a9f11776so9182349a12.1
        for <linux-man@vger.kernel.org>; Sat, 18 Jul 2026 11:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784398561; x=1785003361; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s5ebDlgYsUrc9JVwAPiTiQZ5K9n3DGcQTOx+TyMNMU8=;
        b=GpbAhnFpzu8BZabIlN/wmoun7H/BEyZIKxp7zmO5BdQwpgojSURVi0K4flNgEIQnjW
         6jDvnIu//llZUnClA9TucbJNk2FaunXVTfyBQf3aMfSCQuSPD9dYSa5EZ4vZcucj4JuA
         7IljhdQKMZbfauBKgQ4eGEYW3ly4sZJBXtgllYZeVclRFU/31lVQLWOprbqXX7/IO11K
         j4dxFyU7W03hQ6B0RL9v3xRKDKcYJMdc38kM5cE9eVdhrq6QCWHQLug37XXfkLsoDmy6
         AdSj4kcE9Krv3MpwvCzKYqejmSxk5D0teXV968y45pm+N2CVwmSsstReuVUa7O9VopZh
         Z0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784398561; x=1785003361;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s5ebDlgYsUrc9JVwAPiTiQZ5K9n3DGcQTOx+TyMNMU8=;
        b=sZPgBEoxz+6HMSw4+nIqvur1IFGEqMCN1KteTmGUFH83oLJUJ9qyXLwsaXIlAjgsMt
         QKp0/42zlKZbqGoa3i1wa15Z2k/u7XwJGP5DBvPSBv4UYhmJRvReVosolNSv+tkdp68c
         W8WC1HxpUaI0hUbas3gPLIOnF/lBlK92Yji1GGpv0nqLCuKZtT/idLDDMCRCxVJ3o/MY
         k66tRU4KLOD43uvZ3Xb2h8Opj7O7KaXHR90EcK4mnJU1ByE4EaNKY9BFwZclyQQkHt6m
         Vpogq1oMXpwheFqwsAQJJWX/9fct7mI9SHex4wyaTF8IFmtHGq1jSlDtoBUQb/yiIWqp
         Nmog==
X-Forwarded-Encrypted: i=1; AHgh+RrKZQ/c1CEHziUCFmfrPsOmriQacivsSPBnRaLNk4TPI+AOR9Lz6sjKpu9d7SZWLDxsPSBnWWydcxg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzE/oW8+NpUcl+UelkopgoNRNUycF6vyqY4Tr21xUlS4lGhbqUk
	+I4gkP9UNZGOuFl1BBRggne4DFIoCYa/i6DlLoqMOHpLqAIJJ6cJtRvBzSBeOUku
X-Gm-Gg: AfdE7ckLB2Y+Q6DounUWYIslor+Yon41zSsWNtjaR6lvWISMBTugeRxjYm5dhDu2nOb
	vRv2dIiBUWfk2ZQBvl+bP0thXYh0cbJC3tsNKAvuVfry5Ysjy44J/digarOoziNvzreUhOK6CfJ
	L2qKz/DFv1T8kQnuil044tNg5NEDW4YLwJaIjrVTCh96dZk2Ke60dxC9NL/n/62YcKYld821/dK
	OBfiTvgf26jYj+yT0yUGvQLloH6edv+yVcqheQXmjVG2qbspGIGTKGjRkZV15HL4LgfGsDhvH/Q
	2qXfKpFMhfQlQlltNUaxV04y3Jp6N+dEuPjXfedCaDGNOr56MmBRepdIn7muRXn4A37cCabnwvu
	3m0+32vUWNH9FE6r4C5+LIycV6ZCBG9svFaWhFPF2z9Vxo3mrditbqRbjb7/EZ9ugdfwqS8Wekg
	PXHZYRNFKOyT77nMsqM3fmek0mEHNZx7HhXJQP
X-Received: by 2002:a05:6402:454a:b0:69c:2fc1:d4d9 with SMTP id 4fb4d7f45d1cf-69e65310169mr2384664a12.31.1784398560429;
        Sat, 18 Jul 2026 11:16:00 -0700 (PDT)
Received: from aabbin (95-24-216-238.broadband.corbina.ru. [95.24.216.238])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6ffbbf40sm2417451a12.15.2026.07.18.11.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 11:15:59 -0700 (PDT)
Date: Sat, 18 Jul 2026 21:15:53 +0300
From: Ivan Sokolov <sugrob9000aero@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: coreutils@gnu.org, linux-man@vger.kernel.org
Subject: Re: ls/dir/vdir(1)
Message-ID: <20260718211553.3cf94325@aabbin>
In-Reply-To: <alueABs-ZbwayZdu@devuan>
References: <aluIbrKBtAxweITC@devuan>
	<alueABs-ZbwayZdu@devuan>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Alejandro,

On Sat, 18 Jul 2026 17:42:24 +0200
Alejandro Colomar <alx@kernel.org> wrote:

> Experimentally, ls(1) and dir(1) seem to be exactly the same.  I'd
> like to document dir(1) with a short page saying that it's equivalent
> to ls(1).  Is this correct, or is there any subtle difference?

=46rom https://www.gnu.org/prep/standards/standards.html#User-Interfaces :

  For example, we provide a dir program much like ls except that its
  default output format is always multi-column format.

That's where I learnt about `dir`, but similar is said in `info dir`.
You can confirm this by comparing the output of `dir|cat` vs `ls|cat`.

I think to know these kinds of differences you'd need to refer to GNU
texinfo pages (short of just reading the source). After all, the GNU
project treats them as the primary documentation.
