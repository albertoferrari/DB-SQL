/**
 * Telefonata effettuata
 */

public class Telefonata {
	
	/** numero chiamato */
	private String numero;
	/** durata in secondi */
	private int durata;
	
	public Telefonata(String numero, int durata) {
		this.numero = numero;
		this.setDurata(durata);
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public int getDurata() {
		return durata;
	}

	public void setDurata(int durata) {
		this.durata = Math.abs(durata);
	}

	@Override
	public String toString() {
		return "numero chiamato:" + numero + " - durata: " + durata + " secondi";
	}
	
}
