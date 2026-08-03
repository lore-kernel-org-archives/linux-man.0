Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D167403B18
	for <linux-man@vger.kernel.org>; Mon,  3 Aug 2026 12:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.165
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785760698; cv=pass; b=FeNg4dPfttYxs4bNWYfjpOsCi4TTv4gN4sNgELqE6ywC9jhvPOxiM2rkLAUsVJAwtBlioQn+EOxRzTZJxFPjvTkI5ftKF70Pi1PxIT6/D83vAkELB5AkvtRAZoooD75ZugiqZkTwYrvcl6NfRFouUYj+G1Hvz0QcQmYy6mhhySg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785760698; c=relaxed/simple;
	bh=9KEk+MVMM8JZacKBm6m6RXhtQtuCXELHzfC5jDaEcyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oKu+X4S78eNRPSH3iY0QgSfZvis1rSLVlWgwGPU7c3nVMdx4sfG+r5TfqP3W4hELwAPuUGs3CSTRw6rOfJFUSI32dETA+CN9iqyPpt6BowrZny0jC3WFuICii4mggIE0sN+53y1upPshiroCK4bRiuf00IsDXHw1YKDqhvPYcOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=clisp.org; spf=pass smtp.mailfrom=clisp.org; dkim=pass (2048-bit key) header.d=clisp.org header.i=@clisp.org header.b=fXzY+9gi; dkim=permerror (0-bit key) header.d=clisp.org header.i=@clisp.org header.b=59WPBiRJ; arc=pass smtp.client-ip=81.169.146.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=clisp.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=clisp.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=clisp.org header.i=@clisp.org header.b="fXzY+9gi";
	dkim=permerror (0-bit key) header.d=clisp.org header.i=@clisp.org header.b="59WPBiRJ"
ARC-Seal: i=1; a=rsa-sha256; t=1785760507; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=pqYjE/rhilMJFxO9WvIYyDOHrSCnXfcJ715GQrZ6K+60PNb77UKpIFGVF9jKYP4V0Z
    IzkG1osS97Er6rytEFN/UE/1i2fzGwe4l7VFtsQHWmI2v3Cvjwh7mDHHCO9dE2Tmp8n7
    H4ekavcxgnWRzJquH0QG612yTPAZHOL1xGHXG6D5AGJdiP2W5mxXAUcSWFL24NoOccuF
    Fs5dNlc6i+NF4M3pc5es23iYMDr96iZhd27iNq6FFXSF3Kt+FMPFAGdptZmXL7FiL8IP
    p9/fTewCgumtDXQw+6M8dn57fVl2IDXQ0PyXEczcuT2PQtD+kgJ5iVi3CvdkTZRPq/1F
    XLSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1785760507;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=WB7HTi6p+T4vGYPN0lvRbDFrC9OCAwZn21eyNLCUrhk=;
    b=gSiv81QERPCYm6EpmKS0OxpUVXHwSMq6z5GTKwPGG+hHv6x3TTcUZh6d1l4ACQzl7A
    q7CR8mtcBj1BSQFqw2paLfj9NEZN04Zs+gcSzhjIwWk9kbire2s6iSS4Ovz4b8dm8Cx/
    koFONK3NvZvD+qRoeN7WuHllvx2WBmiD0H7Qwfdcsnd3Jo3EgNHv5CsrUHS73joKTOjy
    DSaGgpjQRpFZigpynWnMDVQpEw3IXJGaAlbsLZba7gcdqNeKR18BHD5/jAWebEw0NjmD
    ZolsCRy55VQv1aUiGmvjXrChEip0kGnF18keOYMSLm+lm/+610faFn2T6AZBJSaKkxiD
    HFZQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1785760507;
    s=strato-dkim-0002; d=clisp.org;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=WB7HTi6p+T4vGYPN0lvRbDFrC9OCAwZn21eyNLCUrhk=;
    b=fXzY+9giSscGrI3B0GJIumbZ7AdC3osrwCoFVWBeID1c3EWYNHEmR2pX+jrbYh7G0P
    rpNETo0PcTQ/Ujl1yCnN4yoowwDSpVCIIh3urjJ+NtPs+aF+qpj2ndu+epIVbZ1sOi+7
    IS13GFj+PVgpFLnt5Jt4/a6F5Boeh8Ydb1cfj4WxqrrRI128KThAvgTx+VnHxPRg0U3y
    4RcS/GNngbLj5N//Mhu83wTJkl+i/4MPLSjd/LqVYTgsjx567cKgACa2cSk7ap0X2yDi
    quqpNSC3s9vQlocookDa7QWryCpUd7p9nnAl1Anag3hRcRK8QQiLzuWL1Q8XMRqkf78g
    CAAg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1785760507;
    s=strato-dkim-0003; d=clisp.org;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=WB7HTi6p+T4vGYPN0lvRbDFrC9OCAwZn21eyNLCUrhk=;
    b=59WPBiRJCwzKesbTys+Iu3PAMx8Ip0H3gYn7umQ+EbezpgkxiBG/y/cz26MDi0qhy0
    wzuTDrR0m8tJr4+H6vDA==
X-RZG-AUTH: ":Ln4Re0+Ic/6oZXR1YgKryK8brlshOcZlLnY4jECd2hdUABIYZgv6aLDTL6Xt7xMndRJvIORZPujrn/AV0gwWK8ZkmMJAwSAE"
Received: from cagnes.localnet
    by smtp.strato.de (RZmta 55.5.6 AUTH)
    with ESMTPSA id N4429c273CZ6652
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 3 Aug 2026 14:35:06 +0200 (CEST)
From: Bruno Haible <bruno@clisp.org>
To: bug-gnulib@gnu.org, libc-alpha@sourceware.org,
 Alejandro Colomar <alx@kernel.org>
Cc: Collin Funk <collin.funk1@gmail.com>,
 "G. Branden Robinson" <g.branden.robinson@gmail.com>,
 Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org
Subject: Re: the Linux man-pages as an educational tool
Date: Mon, 03 Aug 2026 14:35:06 +0200
Message-ID: <4636165.RUnXabflUD@cagnes>
In-Reply-To: <am6X32HkGdm2xTd7@devuan>
References:
 <cover.1785532392.git.alx@kernel.org> <87cxw1s58a.fsf@gmail.com>
 <am6X32HkGdm2xTd7@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Alejandro Colomar wrote:
> This is just a case where educating on the current standards is done by
> 1) documenting at the bottom of the manual what the standard says, and

The standard-compliant #include statement should be documented in the SYNOPSIS,
not at the bottom of the man page.

> 2) recommending to ignore it because it's bad.  When the standards are
> bad, this is appropriate course.

Which functions are "bad"? It's not up to you (single person) to decide this.
Rather, poll among the libc implementors, and if a majority says a function
is "bad", then mark it as bad.

That's basically how it went with 'gets': The community realized it is a bad
function, then the implementors started to withdraw it.

And even there, look at several implementors, not only at a single one. For
instance, NetBSD considers uselocale() to be "bad" and therefore does not
implement it. That's a single-implementor opinion, not a majority.

Bruno



