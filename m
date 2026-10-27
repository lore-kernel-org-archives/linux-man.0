Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793087914;
	b=yfCp6lO6luVczq9yWRzTO5Qct1oqJPXD6PxEBXecJPB4TqJjtSoGehY9kml1iOHa9SuR
	 Ef651za8GcixPe7DqAn8QGh5h3k62UVixElb+sdg3vF8FnsiSol9BPVTKbW6H3byvFW2Q
	 d/YzQ4PqUR9wjYGktveHpD7V+iRCiRXVkR2/yU7lKHTOBAu9v51cCT4dwgVKwo8eI+anF
	 RX9AHyMc+f1f2A9e71OBppLbqLCnk9gOtwDO827/s03bkCp8jeSCW6L3m7J7nqERmUAKR
	 7svVvHaMSOgCE0dBSPwOYmu0X1BJRU7zP667UmpUSi8ojiO2KM3ZQkblzJFbwa+Litw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793087914;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=o4P/h6BOSK68nzEztGf/TOB2iMzhMrlqi4cF6rIbDg8=;
	b=CENBc/1n0CK97zVltfGIA2AcSmYamhJNtU7+QLhkZ8uVrkm2Bi69jHvFvfYpOK4Gi+vf
	 Uamha3pXFHIRm4yfdD1oGX0bukuHDk39ccZk2rZFDjCNvKdi0gfQBdIKbJMCiaTocJ5wH
	 2x7JG153ohfY9WFynbt4cnWhFBQLPSPHYc4aCW0dv72yGnJ7uNvPaoeQwt243Mz05gNZt
	 5LsJPz0C8ZuC9RwBtAvIo1J+1PQH2rkXH3HXKL2gkLGZDbZ7n9ZcMmKdHgolw2spxnQal
	 kfawxpge9/D991g4wHSaAWUzDOhsXy17FGnDYuK1DJjNOZY80Xnz/6t1uFFkqXMchRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xd7d+Jaj;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A987C606A31A
	for <linux-man@vger.kernel.org>; Tue, 27 Oct 2026 07:58:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A987C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xd7d+Jaj
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so20645565e9.3
        for <linux-man@vger.kernel.org>; Tue, 27 Oct 2026 00:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793087912; x=1793692712; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o4P/h6BOSK68nzEztGf/TOB2iMzhMrlqi4cF6rIbDg8=;
        b=Xd7d+JajcKgpeAZSAbcPb/AeuCa4lZXu14Hn07ssJfFhlROKqVvKvh+12cMK5e/2+j
         UacEStNXOLpqkaybwXHm+5/X4Q6zngPWH+oarKVbZSihzoYxOwEjemzvuTEEcT6JRSmr
         RSnOLawPuqMCLEygOJkZ/+QoJiKaBor8RUOe1RxbRj1oyfQilpmc38/sYx2ClN1Ps9L/
         5G/m7+qZhnP6Xscyig/lSnXPQ+YJcJ8ZxGRnNjIqiCREhFFp/v5rcp/pafZE3DD8FSAu
         qEV5pD1j+kqcc5Vd1HLPCVT3WeBbthCuMBwOsK2Igx42JWJf80MJz8oNOX3rtg03Utzq
         dj2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793087912; x=1793692712;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=o4P/h6BOSK68nzEztGf/TOB2iMzhMrlqi4cF6rIbDg8=;
        b=X0C23jnweE2U9AXlqMthQbJ231mDokc7zHJnVkelvBXC8sGfQkczyYEQI+jZAVNXfa
         +FJHYdoEYJQUWoL55HKJCTViwEuRqaRRkeHfe3flGMZnsyJR+X1mhXUO1aj7MYaUnCZK
         3bZIPiSC+By1SaMGJ6fW0MDF8xU27MW92OwjFMF2gee7fiYCmkYCDb6tJIqfn1noDF41
         h0IQ/AfZTsrUh8Fk1yj5EiLYMaJKiQN8bASfke6d62sv/AfVviXEVW+Hrlo7ZjjP+ZtF
         ePjDQGO83C4z0wtrbtjgjozafpFxTOwUzZBj4gkDGQxKEDI1do9Y9d1a1yvMUZFPnU1e
         W/EA==
X-Forwarded-Encrypted: i=1; AKwUvBzaiMJI/KJ/4L0vjIewEDv8GOU4OugSWwjTI40MLlseRu9XTlvuUTNx170rFkiivydrmJvTFu01SrI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLEmVS+s+Lbjj/9dK/7sJNfEreQgnaa1snz6T9iREtfRolwuN87
	P/D/oxh2ytGv7FgHmtehJkMKztyRe51kUflXR8tMTU2rO+1j4NdjcQ8lVLH0kea3
X-Gm-Gg: AYBFou09ayhusogwLmH/wb3DFovoMWGrFVHM7jffj2rWDJt/dk9Ha3cj4k/lBR6JbY7
	SRIqwCUSoZFrdNagdFUqatGJGKB+4t42TAR4kskLJeg13al7g8HfhDAzDkKoxv+FXj+s+A3kBzg
	cRErd1DLCW97YOt/rQLKUf6nvtigLlM4XGvNdMi1M0xhUCbm6synmUzqlBW7FPdKbHKcAgJNuK/
	GSmC+Ao1AL9ufsmJ/KoTCHP7v8tq2OkoEBrZUD9JCysDzqzhoKcqsHKg3jmuNCbW7zCsTbaX6Fn
	NzpnC3PrPO8So/4Jau0cobwCTQkRpUBpmtP9aXFb3MbaJKwYQyNDm3uYixkbRniYfGXCpLi8qpV
	ORsb26i+o3vahzW5LpaDMJnAQzmR1a7JR3P595rpm4jcgVdDXqbrkU4LENvG0jqcMScuIh5mLk+
	pAIPMJdrChfQVmWwtlRmU1IltNAW42EWJyJfTWLS17INcYCYJlTA/NcJqAD4AUCNynId+YW5Xn6
	fK05fAa3H02wcqorAsA+nW2+0N0cnstYdPSrDd4j0u53kBL6BMLNrWKMutCIoNwufrrrFf6QYcS
	SFjV
X-Received: by 2002:a05:600c:524d:b0:4a1:a45a:88f with SMTP id 5b1f17b1804b1-4a35acb07c5mr155809505e9.20.1793087911856;
        Tue, 27 Oct 2026 00:58:31 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a5822a7sm258554725e9.11.2026.10.27.00.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:58:31 -0700 (PDT)
Date: Tue, 27 Oct 2026 08:58:02 +0100
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org
Subject: Re: [PATCH 4/8] man/man7/unix.7: Explain Abstract UDS scoping to the
 network namespace
Message-ID: <20261027.ee7de7571a15@gnoack.org>
References: <20261021210800.27338-2-gnoack3000@gmail.com>
 <20261021210800.27338-6-gnoack3000@gmail.com>
 <atxDa5S8RPeZTm7C@google.com>
 <20261026.dc0f52217f35@gnoack.org>
 <auAxv0HZ14Nz5xDi@google.com>
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
In-Reply-To: <auAxv0HZ14Nz5xDi@google.com>

Thanks for the review!

On Tue, Oct 27, 2026 at 05:12:54AM +0000, Kuniyuki Iwashima wrote:
> On Mon, 26 Oct 2026 22:11:56 +0100, Günther Noack wrote:
> > On Sat, Oct 24, 2026 at 05:39:52AM +0000, Kuniyuki Iwashima wrote:
> > > > remote socket is looked up through the mount namespace.
> > > > 
> > > > To avoid confusion, remove the word "namespace" from the subsequent
> > > > paragraph, where it is used in a more colloquial form (there is no
> > > > abstract socket namespace in the sense of namespaces(7)).
> > > 
> > > The change still uses "abstract socket namespace".
> > 
> > In the "Abstract Sockets" section, the word "namespace" is not used
> > any more in the general sense, but only in the sense of a
> > setns(2)/namespaces(7) namespace.
> > 
> > There are some places in the man page where the word "namespace" is
> > still used colloquially, but these are not in the vicinity of this
> > change and feel less prone to confusion.  Do you think I should update
> > these all in the same commit?
> 
> I understand the "namespace" itself is a generic word but it
> feels a bit odd as it most likely means CLONE_NEWXXX in Linux.
> 
> But fixing up all would be apparently boring, so I'll let you
> decide, and leaving them as is is 100% fine ;)

On the other hand, it's not much work either.  I'll create a small
extra patch as part of this series to clean up the remaining uses of
namespace.  We can discuss that separately then.

–Günther
