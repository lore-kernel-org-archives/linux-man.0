Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795784572;
	b=jYpHGfgjs3eJ1xzSI43ZAsGnytuyj1zdxkiU7RS4xE4mPhh0HK5/wSOIOxRsPkiaP3N2
	 WeHj3GtJmReB3FMGKk9xvQM/2kAICLjJusGfgalMulp8U4gHRktGDNaKK9dNKHL0guW3I
	 Hq7H7anEvGWIfiV7SyFwqLwjl5bGM4E50nz6JG66DWxAiqHbwshfLi6QolQ0Hv8cAPkIo
	 rVUePvUBqiLrYRnWn/Qzig5qv8cbQAEEDoEuqabig1RQE5KsYk3lk9SfJ99DfNs/3Vyk6
	 a5XrdzYR1HL3OjGP87i8BasuzGG1H6gRhjmvNcyh5VBQWm+fLZDrplhwhRG4hF3HUuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795784572;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=vSYoEa69pTYsYmF8GKYrl5WBGdnXnjosEXrR1sp19jg=;
	b=xp0xOTxZVLl9pOm2V4A0+by511inmRoF0k3/KWn7Nv5isLXAwBbpnW4G8IsU1r46fipX
	 D5zX7qT7oVbnUQ1EsFwT2XlU1v8wYVIMJIG6BOl1F2dO9pIYl93PUYMwcrJCXb5L0KhQH
	 XLt6dcN6iHiLPn4jKCL2KidjbdlWQdjYT19aFkfkOGZVwDvPk64wOI9loPKld8gjXZimV
	 rRb1HreyQLPbLkzhMsHvGoQQcT3Aqb5uayQf5uYeQRTnqA/LEUILx9oSBdx67/ycZJHje
	 8GVpsBdXtaSVQHddwq/zTItOEhryhYe7A1hQ3FUO0Q4hfn169P1DeuJgoqcbX1ykM7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MFjzSaJ9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E615606A31C
	for <linux-man@vger.kernel.org>; Fri, 27 Nov 2026 13:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MFjzSaJ9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE65A1F00919;
	Fri, 27 Nov 2026 13:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795784571;
	bh=vSYoEa69pTYsYmF8GKYrl5WBGdnXnjosEXrR1sp19jg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MFjzSaJ91Uqtp08cVzAulKmrRATe9WevqFNUpSw/IIEruLW6c/xtItnnDdFljKabl
	 qUp/XLjsWfnKdI+ZZ46wG5uzbjl8kYPv3CUMVlCf6OxQSWA8GUQ5Gy/CPulaJiShzu
	 lCAHyErqq7k1qE6Xy3v3yckX+mitwrNuztuz0wCWoyFKWwZzGir0XSbp5J4SkeaZ+f
	 Y7E0oSJPZ4IrMin2Caqfcb1KWm3engnaY4fTjdPJLrzK0knsjQR2oyi4nM1LsP7von
	 nD32xttVwUCJUxZQljUJmJTSbIdb7i1urnk7oRk9W8irfPHQF0VD0dx9UufZhlw6Sb
	 Qmr9NSBC1Iv/Q==
Date: Fri, 27 Nov 2026 14:02:47 +0100
From: Christian Brauner <brauner@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: Alejandro Colomar <alx+linux-man@kernel.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, linux-man@vger.kernel.org, 
	Alexander Mikhalitsyn <alexander@mihalicyn.com>, Eric Dumazet <edumazet@kernel.org>
Subject: Re: [PATCH v2 6/8] man/man7/unix.7: Document SO_PASSPIDFD,
 SO_PEERPIDFD, and SCM_PIDFD
Message-ID: <20261127-auflockern-stilvoll-bauindustrie-287d1434c59e@brauner>
References: <20261103202211.13820-1-gnoack3000@gmail.com>
 <20261103202211.13820-7-gnoack3000@gmail.com>
 <20261118-schnorren-apotheke-markant-b8178cac4a9b@brauner>
 <20261120.a284167287ae@gnoack.org>
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
In-Reply-To: <20261120.a284167287ae@gnoack.org>

On Fri, Nov 20, 2026 at 04:59:26PM +0100, Günther Noack wrote:
> * When the message was sent before SO_PASSPIDFD was enabled.
> * When recvmsg() on a stream socket returns 0 (EOF).
> 
> Is that correct?  I am not sure whether these corner cases are in
> scope for this documentation fix, and I am not sure I have the
> complete picture here. (Are there missing other cases? Does it also
> affect other process-identifying SCM_* rights?)

Yes. The sender only attaches its pid if at send time one of the two
sockets has SO_PASSCRED, SO_PASSPIDFD or SO_PASSPIDFD_THREAD set, the
receiving socket hasn't been accepted yet, or the sender passes
SCM_CREDENTIALS explicitly. Otherwise there's no pid and so no
SCM_PIDFD.

If there's no control buffer or it's too small no SCM_PIDFD is generated
either and MSG_CTRUNC is set.

SCM_CREDENTIALS is different. It's always generated if SO_PASSCRED is
set. Without sender credentials it carries pid 0 and the overflow
uid/gid.

> For now, I'd lean to soften the wording about "in each subsequently
> received message" to "in subsequently received messages".

Sounds good.
