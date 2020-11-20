import java.util.ArrayList;

/**
 * SIM telefonica
 */

public class Sim {
	
	/** numero di telefono */
	private String numero;
	/** credito */
	private float credito;
	/** lista chiamate effettuate */
	private ArrayList<Telefonata> listaChiamate;
	
	public Sim(String numero, float credito) {
		this.numero = numero;
		this.setCredito(credito);
		listaChiamate = new ArrayList<Telefonata>();
	}
	
	public Sim(String numero) {
		this.numero = numero;
		this.credito = 10;
		listaChiamate = new ArrayList<Telefonata>();
	}
	
	public String getNumero() {
		return numero;
	}
	public void setNumero(String numero) {
		this.numero = numero;
	}
	public float getCredito() {
		return credito;
	}
	public void setCredito(float credito) {
		this.credito = Math.abs(credito);
	}
	
	/**
	 * aggiunge una telefonata
	 * @param t nuova telefonata
	 */
	public void inserisciTelefonata(Telefonata t) {
		this.listaChiamate.add(t);
	}
	
	/**
	 * durata telefonate
	 * @return durata in ore minuti e secondi
	 */
	public String durataTelefonate() {
		String s = "";
		int somma = 0;
		for (Telefonata t : listaChiamate) {
			somma += t.getDurata();
		}
		int ore = somma / 3600;
		int min = (somma / 60) % 60;
		int sec = somma % 60;
		if (ore < 10)
			s += "0" + ore;
		else
			s += ore;
		if (min < 10)
			s += ":0" + min;
		else
			s+= ":" + min;
		if (sec < 10)
			s += ":0" + sec;
		else
			s+= ":" + sec;
		return s ;
	}

	@Override
	public String toString() {
		String s = "numero SIM " + numero + " credito " + credito;
		for (Telefonata t : listaChiamate) {
			s += "\n *** "+ t.toString();
		}		
		return s;
	}
	
	
}
